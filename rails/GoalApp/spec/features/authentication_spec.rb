require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
		visit new_user_url 
		expect(page).to have_content "Register"
	end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do 
			visit new_user_url
			fill_in "Username", with: "rock_lee"
			fill_in "Password", with: "naruto"
			click_button "Register"

			expect(page).to have_content("Welcome rock_lee")
		end

  end
end

feature 'logging in' do
	given(:rock_lee) { User.create!(username: "rock_lee", password: "naruto") }

  scenario 'shows username on the homepage after login' do 
		rock_lee
		visit new_session_url
		fill_in "Username", with: "rock_lee"
		fill_in "Password", with: "naruto"
		click_button "Login"

		expect(page).to have_content("Welcome rock_lee")
	end

end

feature 'logging out' do
	given(:rock_lee) { User.create(username: "rock_lee", password: "naruto") }
  
	scenario 'begins with a logged out state' do 
		visit new_session_url
		expect(page).to have_content "Login"
	end

  scenario 'doesn\'t show username on the homepage after logout' do 
		rock_lee
		visit new_session_url
		fill_in "Username", with: "rock_lee"
		fill_in "Password", with: "naruto"
		click_button "Login"

		click_button "Logout"
		expect(page).not_to have_content("rock_lee")
	end 
end