require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:dashboard) {FactoryGirl.create :dashboard}

  describe "GET #new" do
    it "returns http success" do
      sign_in dashboard.users.first
      xhr :get, :new
      expect(response).to have_http_status(:success)
    end
  end

end
