# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Listing.destroy_all
Bid.destroy_all

pub_owner = User.create(email: "lister@test.com", password: "123456", company_name: "pub", location: "Hoxton", description: "I have a loevly pub")
test_listing = Listing.create(user_id: pub_owner.id, category: "larger", estimated_volume: 5, min_bid: 100, unit_type: "bottles", description: "My lovely pub want tasty beer", requirements: "POS", deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now )

brander = User.create(email: "brander@test.com", password: "123456", company_name: "drinks maker", location: "Shoreditch", description: "I purvey the best largers")

Bid.create(listing_id: test_listing.id, user_id: brander.id, amount: 200, sweetner: 'POS poster')
