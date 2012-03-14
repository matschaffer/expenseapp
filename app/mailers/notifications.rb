class Notifications < ActionMailer::Base
  default from: "from@example.com"

  def new_purchase(purchase)
    @purchase = purchase
    mail to: purchase.user.email
  end
end
