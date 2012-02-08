class User < ActiveRecord::Base
  belongs_to :household
  has_many :purchases
end
