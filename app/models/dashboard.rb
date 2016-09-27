class Dashboard < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :events, dependent: :destroy

  monetize :balance_cents

  def add_event(event_data)
    event = self.events.build event_data
    event.kind == 'income' ? self[:balance_cents] += event.amount.fractional :
                             self[:balance_cents] -= event.amount.fractional

    self.save
  end

  def colaborators
    users.merge(Membership.colaborators)
  end

  def owner
    users.merge(Membership.administrators).take
  end

end
