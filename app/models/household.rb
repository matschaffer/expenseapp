class Household < ActiveRecord::Base
  has_many :users
  has_many :purchases, through: :users
  has_many :invites
end
