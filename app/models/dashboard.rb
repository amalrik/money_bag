class Dashboard < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  monetize :balance_cents

  def add_event(event_data)
    event = self.events.build event_data
    event.kind == 'income' ? self[:balance_cents] += event.amount.fractional :
                             self[:balance_cents] -= event.amount.fractional

    self.save
  end

  #def balance_cents=(event)
  #  event.kind == 'income' ? self[:balance_cents] += event.amount.fractional :
  #                           self[:balance_cents] -= event.amount.fractional
  #end
end
