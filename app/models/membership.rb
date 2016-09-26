class Membership < ApplicationRecord
  belongs_to :dashboard
  belongs_to :user

  scope :administrators, -> { where(owner: true) }
  scope :colaborators, -> { where(owner: false) }
end
