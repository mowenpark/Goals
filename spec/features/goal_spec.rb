require 'spec_helper'
require 'rails_helper'

feature "creating a goal" do
  before(:each) do
    sign_up("matt", "starwars123")
  end

  it "validates title can't be blank" do
    create_goal("")
    expect(page).to have_content("Title can't be blank")
  end

  it "automatically sets public option to no" do
    create_goal("Learn Rails!")
    save_and_open_page
    expect(page).to have_content("Learn Rails!")
    expect(page).to have_content("Private")
  end

  it "automatically sets goal completion to false" do
    create_goal("Learn Rails!")
    expect(page).to have_content("Learn Rails!")
    expect(page).to have_content("Working on it!")
  end
end
