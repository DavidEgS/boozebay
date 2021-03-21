class Api::V1::BidsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :update, :show ]

  before_action :set_bid, only: [ :show, :update ]

  def show
  end

  def update
    unless @bid.update(bid_params)
       render_error
    end
    send_winning_bid_email
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.save
    unless @bid.save
      render_error
    end
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.permit(:sweetner, :amount, :listing_id, :selected)
  end

  def render_error
    render json: { errors: @bid.errors.full_messages },
      status: :unprocessable_entity
  end

  def send_winning_bid_email
    UserMailer.with(bid: @bid).contract.deliver_now
  end
end
