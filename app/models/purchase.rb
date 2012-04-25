class Purchase < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true

  acts_as_taggable

  def self.recent
    where("purchases.created_at >= ?", 5.days.ago)
  end

  scope :sorted, order('created_at desc')
  default_scope sorted

  def budgets
    user.budgets.where(tag: tag_list)
  end

  after_save :update_budgets
  def update_budgets
    budgets.each { |b| b.recompute }
  end

  def self.create_from_email(message)
    user = User.find_by_email(message[:from])
    tag_list, description = message[:plain].split("\n")[0..1]
    create(description: description,
           tag_list:    tag_list,
           amount:      message[:subject].to_f,
           user:        user)
  end
end
