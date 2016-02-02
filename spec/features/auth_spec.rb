require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      sign_up("Testing_username", 'abcdef')
    end
    it "shows username on the homepage after signup" do
      expect(page).to have_content('Testing_username')
    end
    it "redirects to goals index" do
      expect(current_path).to eql("/goals") #(current_path).to equal()
    end
  end
  feature "Failing to sign up" do
    it "rejects an empty username" do
      sign_up("", "abcdef")
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Username can't be blank")
    end

    it "rejects an empty password" do
      sign_up("abcdef", "")
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Password is too short")
    end

    it "Prevents logging in with empty password" do
      sign_up("abcdef", "")
      expect(page).to have_content("Sign Up")
      expect(page).to_not have_content("abcdef")
    end
  end
end

feature "logging in" do

  before(:each) do
    sign_up("matt", "password123")
    click_button "Sign Out"
  end

  it "shows username on the homepage after login" do
    sign_in("matt", "password123")
    expect(page).to have_content("matt")
  end

  feature "redirects to new session when" do
    it "has a blank password" do
      sign_in("matt", "")
      expect(page).to have_content("Sign In")
      expect(page).to have_content("Invalid password or username")
    end

    it "has a blank username" do
      sign_in("", "password123")
      expect(page).to have_content("Sign In")
      expect(page).to have_content("Invalid password or username")
    end
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit "/goals/"
    expect(page).to have_content("Sign In")
  end

  it "doesn't show username on the homepage after logout" do
    sign_up("matt", "password123")
    click_button "Sign Out"
    expect(page).to_not have_content("matt")
  end
end
