FactoryGirl.define do
  factory :dashboard do
    balance_cents 0
    after(:create) do |dashboard|
      dashboard.users << create(:user)
    end
  end
end
