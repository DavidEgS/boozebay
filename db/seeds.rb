Listing.destroy_all
Bid.destroy_all
User.destroy_all

# pub_owner = User.create(email: "lister@test.com", password: "123456", company_name: "pub", location: "Hoxton", description: "I have a loevly pub")
# test_listing = Listing.create(user_id: pub_owner.id, category: "larger", estimated_volume: 5, min_bid: 100, unit_type: "bottles", description: "My lovely pub want tasty beer", requirements: "POS", deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now )

# brander = User.create(email: "brander@test.com", password: "123456", company_name: "drinks maker", location: "Shoreditch", description: "I purvey the best largers")

# Bid.create(listing_id: test_listing.id, user_id: brander.id, amount: 200, sweetner: 'POS poster')


# PUBS
session = GoogleDrive::Session.from_config("config.json")
# Initialize the sheet we are going to work with
ws = session.spreadsheet_by_key("1B1Qx7BRc5hF8t6IvF6HRa82ktGnu17tiMiKcSZA5oxQ").worksheets.first #CHECK KEY IF IT IS THE RIGHT ONE OR THE TRIAL ONE

headers = ws.rows.first

ws.rows.each_with_index do |row, idx|
    next if idx.zero?
    pubs_data = Hash[[headers, row].transpose]
    location = pubs_data['location'].split[-2]
    p location.split(',').first
    User.create(
        email: "#{pubs_data['company_name'].split.join('.')}@email.com",
        password: "123456",
        company_name: pubs_data['company_name'],
        location: location.split(',').first.downcase.capitalize.to_s
    )
end


# BRANDS
User.create(email: 'enotria@email.com', password: '123456', brand: true, company_name: 'Enotria', location: 'London', description: 'Drinks Trade company')
User.create(email: 'speciality@email.com', password: '123456', brand: true, company_name: 'Speciality Drinks', location: 'London', description: 'Drinks Trade company')
User.create(email: 'black.cow@email.com', password: '123456', brand: true, company_name:'Black Cow', location: 'London', description: 'Spirits Maker')
User.create(email: 'fever@email.com', password: '123456', brand: true, company_name: 'Fever Tree', location: 'London', description: 'Soft Drinks Company')
User.create(email: 'magic@email.com', password: '123456', brand: true, company_name: 'Magic Rock', location: 'London', description: 'Beer Manufacturer')
p User.create(email: 'fourpure@email.com', password: '123456', brand: true, company_name: 'Fourpure', location: 'London', description: 'Beer Manufacturer')
User.create(email: 'sacred@email.com', password: '123456', brand: true, company_name: 'Sacred Gin Ltd', location: 'London', description: 'Gin maker')
User.create(email: 'exale@email.com', password: '123456', brand: true, company_name:'Exale Brewing', location: 'London', description: 'Beer Manufacturer')
User.create(email: 'boutinot@email.com', password: '123456', brand: true, company_name:'Boutinot Wines', location: 'London', description: 'Wine supplier')
User.create(email: 'karma@email.com', password: '123456', brand: true, company_name: 'Karma Cola', location: 'London', description: 'Soft Drinks Brand')



# LISTINGS
Listing.create(user_id: User.where(brand: false).sample.id, category: 'gin', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like to change the house gin', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'gin', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like to change the house gin', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)

Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'kegs', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'kegs', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'cans', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)

Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like house red for steak night', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 1000, min_bid: 1500, unit_type: 'bottles', description: 'Looking for a new soft drinks supplier')


# BIDS
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Sacred Gin Ltd').id, amount: 250, sweetner: 'POS poster')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Sacred Gin Ltd').id, amount: 250, sweetner: 'POS poster')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 125, sweetner: 'Sparkle barker')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 125, sweetner: 'Sparkle barker')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 370, sweetner: 'POS poster')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 370, sweetner: 'POS poster')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Black Cow').id, amount:200, sweetner: 'Branded glassware and marketing')
Bid.create(listing_id: Listing.where(category: 'gin').sample.id, user_id: User.find_by(company_name: 'Black Cow').id, amount:200, sweetner: 'Branded glassware and marketing')



Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Magic Rock').id, amount: 500, sweetner: 'free stock and branded glasses')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Fourpure').id, amount: 600, sweetner: 'branded glasses and events')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Exale Brewing').id, amount: 500, sweetner: 'Tshirts')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Fourpure').id, amount: 600, sweetner: '400 flyers')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Magic Rock').id, amount: 230, sweetner: 'Event give away tickets and poster')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Exale Brewing').id, amount: 400, sweetner: 'Social Media Marketing')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 300, sweetner:'Every 12, one free')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 800, sweetner: 'Free training to the staff')
Bid.create(listing_id: Listing.where(category: 'beer').sample.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 300, sweetner: 'Free training to the staff')


Bid.create(listing_id: Listing.where(category: ''))
