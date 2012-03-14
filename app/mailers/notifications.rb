class Notifications < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_purchase.subject
  #
  def new_purchase
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
