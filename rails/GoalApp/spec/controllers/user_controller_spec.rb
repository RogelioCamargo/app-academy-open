require 'rails_helper'

RSpec.describe UserController, type: :controller do
	subject(:user) do 
		User.create!(username: "rock_lee", password: "naruto")
	end 

	describe "POST #create" do 
		context "with invalid parameters" do 
			it "validates the presence of username and password" do 
				post :create, params: { user: { username: "rock_lee" } }
				expect(response).to render_template(:new)
				expect(flash.now[:errors]).to be_present
			end 

			it "validates the password is at least 6 characters" do 
				post :create, params: { user: { username: "rock_lee", password: "short" } }
				expect(response).to render_template(:new)
				expect(flash.now[:errors]).to be_present
			end 
		end 

		context "with valid parameters" do 
			post :create, params: { user: { username: "rock_lee", password: "naruto"  } }
			expect(response).to redirect_to(user_url(User.last))
		end 
	end 

	describe "GET #new" do
		get :new, params: { id: user.id }
		expect(response).to render_template(:new)
	end 

	describe "GET #show" do 
		get :show 
		expect(response).to render_template(:show)
	end
end
