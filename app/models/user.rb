class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable
  has_many :memberships, dependent: :destroy
  has_many :dashboards, through: :memberships
  validates_uniqueness_of :email

  def admin?
    self.dashboards.merge(Membership.administrators).present?
  end
end
