class Api::V1::PagesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  def profile
    @user = current_user
  end
end
