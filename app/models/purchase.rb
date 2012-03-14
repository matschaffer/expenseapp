class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true
  acts_as_taggable

  def self.recent
    where("purchases.created_at >= ?", 14.days.ago)
  end
end
