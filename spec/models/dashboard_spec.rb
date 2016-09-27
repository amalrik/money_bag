require 'rails_helper'

RSpec.describe Dashboard, type: :model do

  let(:dashboard) { FactoryGirl.create :dashboard }
  
  describe '#add_event' do
    
    context 'with valid params' do
      it "adds an event" do
        expect {dashboard.add_event "dashboard_id" => dashboard.id, 
                                    "date" => "2016-09-06 10:37:42", 
                                    "kind" => "income", 
                                    "description" => "salary", 
                                    "amount"=>"1000" }.to change{Event.count}.by(1)
      end
    end
  end
end
