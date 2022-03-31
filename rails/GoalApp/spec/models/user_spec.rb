require 'rails_helper'

RSpec.describe User, type: :model do
	subject(:user) do 
		User.create!(username: "naruto", password: "sakura")
	end

  describe "validations" do 
		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:password_digest).with_message("Password can't be blank") }
		it { should validate_length_of(:password).is_at_least(6).on(:create) }
		it { should validate_uniqueness_of(:username) }
	end 

	it "creates a password digest when a password is given" do 
		expect(user.password_digest).to_not be_nil 
	end 

	it "creates a session token before validation" do 
		user.valid?
		expect(user.session_token).to_not be_nil 
	end 

	describe "instance methods" do 
		describe "#is_password?" do 
			it "verifies a password is correct" do 
				expect(user.is_password?("sakura")).to be(true)
			end 

			it "verifies a password is incorrect" do 
				expect(user.is_password?("rock_lee")).to be(false)
			end 
		end 

		describe "#reset_session_token" do 
			it "sets a new session token on the user" do 
				user.valid? 
				old_session_token = user.session_token
				user.reset_session_token! 

				expect(user.session_token).to_not eq(old_session_token)
			end 

			it "returns a new session token" do 
				expect(user.reset_session_token!).to eq(user.session_token)
			end 
		end 
	end

	describe "class methods" do 
		describe "::find_by_credentials" do 
			before { user.save! }

			it "returns user if provided valid credentials" do 
				expect(User.find_by_credentials("naruto", "sakura")).to eq(user)
			end

			it "returns nil if provided invalid credentials" do 
				expect(User.find_by_credentials("naruto", "rock_lee")).to be_nil 
			end
		end 
	end 
end
