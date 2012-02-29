class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true
  acts_as_taggable
end
