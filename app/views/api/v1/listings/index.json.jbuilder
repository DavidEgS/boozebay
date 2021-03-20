json.array! @listings do |listing|
  json.extract! listing, :id, :category, :deal_start_date, :deal_end_date, :auction_end_time, :estimated_volume, :min_bid, :unit_type, :closed_bids, :description, :requirements, :auction_open
end
