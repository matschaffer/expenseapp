module ApplicationHelper
  def recent_household_purchases
    current_user.
      recent_household_purchases if
        current_user
  end

  def std_button
    'nice medium blue radius button'
  end
end
