require 'rails_helper'

feature "commenting" do
  given!(:rock_lee) { FactoryBot.create(:rock_lee) }
  given!(:sasuke) { FactoryBot.create(:user, username: "sasuke") }
  given!(:mission_goal) do
    FactoryBot.create(:goal, author: sasuke)
  end

  background(:each) do
    login_as(rock_lee)
    visit user_url(sasuke)
  end

  # shared examples are another way to DRY out your specs
  # have some docs:
  # https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
  shared_examples "comment" do
    scenario "should have a form for adding a new comment" do
      expect(page).to have_content "New Comment"
      expect(page).to have_field "Comment"
    end

    scenario "should save the comment when a user submits one" do
      fill_in "Comment", with: "my magical comment!"
      click_on "Save Comment"
      expect(page).to have_content "my magical comment!"
    end
  end

  feature "user profile comment" do
    it_behaves_like "comment"
  end

  feature "goal comment" do
    background(:each) do
      click_on mission_goal.title
    end

    it_behaves_like "comment"
  end
end
