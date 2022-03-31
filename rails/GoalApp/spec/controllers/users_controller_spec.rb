require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
			it "redirects to user's show template on success" do 
				post :create, params: { user: { username: "rock_lee", password: "naruto"  } }
				expect(response).to redirect_to(user_url(User.last))
			end
		end 
	end 

	describe "GET #new" do
		it "renders the new template" do 
			get :new
			expect(response).to render_template(:new)
		end
	end 

	describe "GET #show" do 
		it "renders the show template" do 
			get :show, params: { id: user.id } 
			expect(response).to render_template(:show)
		end
	end
end
