class Event < ApplicationRecord
  belongs_to :dashboard
  enum kind: {
    income: 0, 
    expense: 1
  }
  monetize :amount_cents
  
end
