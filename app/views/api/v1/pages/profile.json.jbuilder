json.extract! @user, :email, :company_name, :location, :description
json.listings @user.listings do |listing|
  json.extract! listing, :id, :category, :deal_start_date, :deal_end_date, :auction_end_time, :estimated_volume, :min_bid, :unit_type, :closed_bids, :description, :requirements, :auction_open
  json.bids listing.bids do |bid|
    json.extract! bid, :id, :sweetner, :amount, :selected
    json.bid_user bid.user, :id, :company_name, :picture
  end
end

json.bids @user.bids do |bid|
  json.extract! bid, :id, :sweetner, :amount, :selected
end


