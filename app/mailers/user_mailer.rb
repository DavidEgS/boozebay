class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contract.subject
  #
  def contract
    @bid = params[:bid]

    mail(to: @user.email, subject: 'Welcome to Le Wagon', from:)
  end
end
