require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  let(:dashboard) {FactoryGirl.create :dashboard}
  before :each do
    allow(controller).to receive(:user_has_access_to_dashboard?).and_return(true)
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in dashboard.users.first
      get :show, params: { id: dashboard.id }
      expect(response).to have_http_status(:success)
    end
  end

end
