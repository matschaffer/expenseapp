module ApplicationHelper
  def recent_household_purchases
    current_user.
      recent_household_purchases if
        current_user
  end
end
