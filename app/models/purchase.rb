class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true

  acts_as_taggable

  def self.recent
    where("purchases.created_at >= ?", 5.days.ago)
  end

  scope :sorted, order('created_at desc')

  def budgets
    user.budgets.where(tag: tag_list)
  end

  after_save :update_budgets
  def update_budgets
    budgets.each { |b| b.recompute }
  end

  default_scope sorted
end
