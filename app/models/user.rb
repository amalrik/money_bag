class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable
  has_many :memberships, dependent: :destroy
  has_many :dashboards, through: :memberships
  validates_uniqueness_of :email

  validates :name, :email, length: { in: 4..100 }
  validates :name, :password, :password_confirmation, :email, presence: true

  def admin?
    self.dashboards.merge(Membership.administrators).present?
  end
end
