class Notifications < ActionMailer::Base
  default from: "notifications@mat-expenseapp.herokuapp.com"
  layout 'email'

  def new_purchase(purchase)
    @purchase = purchase
    mail to: purchase.user.email
  end

  def household_invite(user, invite)
    @user = user
    @invite = invite
    mail to: invite.sent_to
  end
end
