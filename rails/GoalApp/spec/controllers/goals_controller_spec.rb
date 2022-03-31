require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
	subject(:rock_lee) do 
		User.create!(username: "rock_lee", password: "naruto")
	end 

	describe 'GET #new' do
    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { rock_lee }
      end

      it 'renders the new Goals page' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

	describe 'POST #create' do
    context 'when logged out' do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it 'redirects to the login page' do
        post :create, params: { goal: {} }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context 'when logged in' do
      before do
        allow(controller).to receive(:current_user) { rock_lee }
      end

      context 'with invalid params' do
        it 'validates the presence of title and url' do
          post :create, params: { goal: { title: 'invld' } }
          expect(response).to render_template('new')
          expect(flash.now[:errors]).to be_present
        end
      end

      context 'with valid params' do
        it 'redirects to the goal show page' do
          post :create, params: { goal: { title: 'teehee', details: 'cats.com' } }
          expect(response).to redirect_to(goal_url(Goal.last))
        end
      end
    end
  end
end
