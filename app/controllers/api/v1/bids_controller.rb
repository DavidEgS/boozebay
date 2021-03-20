class Api::V1::BidsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  before_action :set_listing, only: [ :show, :update ]

  def show
  end

  def update
    unless @bid.update(bid_params)
      render_error
    end
  end

  def create
    @bid = Bid.new(bid_params)
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:amount, :sweetner, :selected, :user_id, :listing_id)
  end

  def render_error
    render json: { errors: @bid.errors.full_messages },
      status: :unprocessable_entity
  end
end
