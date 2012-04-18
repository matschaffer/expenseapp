class Budget < ActiveRecord::Base
  belongs_to :user

  def purchases
    user.purchases.tagged_with(tag)
  end

  def recompute
    total = purchases.sum(:amount)
    update_attribute(:current_total, total)
  end

  scope :exceeded, where('amount > current_total')
end
