require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:matt) {User.create!(username: "matt", password: "starwars123")}
  let(:spec_goal) {Goal.create!(title: "Learn Rspec", user_id: matt.id)}
  describe "Edit method" do
    before do
      allow(controller).to receive(:current_user) { matt }
    end

    it "renders the edit page" do
      get :edit, {id: spec_goal.id}
      expect(response).to be_success
    end

    it "populates values with old params" do
      get :edit, {id: spec_goal.id}
      expect(assigns(:goal).title).to eql("Learn Rspec")
    end
  end


end
