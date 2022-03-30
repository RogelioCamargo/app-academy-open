require 'rails_helper'

RSpec.describe User, type: :model do
	subject(:user) do { User.new(username: "naruto", password: "sakura") }

  describe "validations" do 
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password_digest).with_message("Password can't be blank") }
		it { should validate_length_of(:password).is_at_least(6).on(:create) }
	end 

	it "creates a password digest when a password is given" do 
		expect(user.password_digest).to_not be_nil 
	end 

	it "creates a session token before validation" do 
		user.valid?
		expect(user.session_token).to_not be_nil 
	end 

	
end
