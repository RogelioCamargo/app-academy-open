module AuthenticationFeaturesHelper
  def sign_up_as(username)
    visit new_user_url
    fill_in "Username", with: username
    fill_in "Password", with: "naruto"
    click_button "Register"
  end

  def login_as(user)
    visit new_session_url
    fill_in "Username", with: user.username
    fill_in "Password", with: "naruto"
    click_button "Login"
  end
end