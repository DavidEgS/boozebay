class Api::V1::ListingsController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show, :update ]

  def index
    @listings = Listing.all
  end

  def show
  end

  def update
    unless @listing.update(listing_params)
      render_error
    end
  end

  def create
    @listing = Listing.new(listing_params)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:category, :deal_start_date, :deal_end_date, :auction_end_time, :estimated_volume, :min_bid, :unit_type, :closed_bids, :description, :requirements, :auction_open)
  end

  def render_error
    render json: { errors: @listing.errors.full_messages },
      status: :unprocessable_entity
  end
end
