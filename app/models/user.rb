class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :budgets_attributes
  belongs_to :household
  has_many :purchases
  has_many :budgets

  accepts_nested_attributes_for :budgets

  def recent_household_purchases
    household.purchases.recent
  end
end
