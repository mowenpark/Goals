require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      visit_new_user_url
      fill_in 'username', with: "Testing_username"
      fill_in 'password', with: "123456"
      click_on "Create User"
    end
    it "shows username on the homepage after signup" do
      expect(page).to have_content('Testing_username')
    end
  end
end

feature "logging in" do

  it "shows username on the homepage after login" do
  end

end

feature "logging out" do

  it "begins with logged out state" do
  end

  it "doesn't show username on the homepage after logout" do
  end
end
