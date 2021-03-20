class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contract.subject
  #
  def contract
    @bid = params[:bid]

    mail(to: 'fernando.requeni@outlook.com', subject: 'Welcome to Le Wagon')
  end
end
