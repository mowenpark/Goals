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
    # save_and_open_page
    expect(page).to have_content("Learn Rails!")
    expect(page).to have_content("Private")
  end

  it "automatically sets goal completion to false" do
    create_goal("Learn Rails!")
    expect(page).to have_content("Learn Rails!")
    expect(page).to have_content("Working on it!")
  end
end

feature "editing a goal" do
  before(:each) do
    sign_up("matt", "starwars123")
    create_goal("learn rails")
    click_button "Edit"
  end

  it "can mark goal as completed" do
    choose("completed", option: "yes")
    click_button "Submit Edit"
    # save_and_open_page
    expect(page).to have_content("Done")
  end

  it "can mark goal as public" do
    choose("public", option: "yes")
    click_button "Submit Edit"
    expect(page).to have_content("Public")
  end



  it "can change the title of a goal" do
    fill_in('title', with: "Pass The Assessment!!!")
    click_button "Submit Edit"
    expect(page).to have_content("Pass The Assessment!!!")
  end

  # it

end
