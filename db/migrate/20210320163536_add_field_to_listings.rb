class AddFieldToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :tag_line, :string
    change_column :listings, :auction_open, :boolean, default: true
    change_column :listings, :closed_bids, :boolean, default: false
  end
end
