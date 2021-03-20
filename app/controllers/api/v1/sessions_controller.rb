class Api::V1::SessionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, only: [ :login ]  
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def login
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token, :brand, :description, :location]), status: :created
    else
      head(:unauthorized)
    end
  end
  
  def destroy

  end

  private

  def user_params
    params.permit(:email, :password, :location, :brand, :description, :company_name)
  end
end