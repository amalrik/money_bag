require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  let(:dashboard) {FactoryGirl.create :dashboard}
  before :each do
    allow(controller).to receive(:check_permission_to_dashboard).and_return(true)
    #controller.stub(:check_permission_to_dashboard).returns(true)
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in dashboard.owner
      get :show, params: { id: dashboard.id }
      expect(response).to have_http_status(:success)
    end
  end

end
