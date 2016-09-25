class Event < ApplicationRecord
  belongs_to :dashboard
  enum kind: {
    income: 0, 
    expense: 1
  }
  monetize :amount_cents
  #composed_of :amount,
  #            :class_name => 'Money',
  #            :mapping => %w(amount cents),
  #            :converter => Proc.new { |value| Money.new(value) }
end
