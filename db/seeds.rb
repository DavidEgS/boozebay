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
User.create(email: 'enotria@email.com', password: '123456', brand: true, company_name: 'Enotria', location: 'London', description: 'Drinks Trade company', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Flt.linkedin.com%2Fcompany%2Fenotria-winecellars-ltd&psig=AOvVaw3OtqtBKLb-XsqfIzfftGNY&ust=1616409514982000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOiLwuqYwe8CFQAAAAAdAAAAABAJ')
User.create(email: 'speciality@email.com', password: '123456', brand: true, company_name: 'Speciality Drinks', location: 'London', description: 'Drinks Trade company', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwhiskymag.com%2Fbrands%2Fspeciality-drinks&psig=AOvVaw2PAmQPGfbE1pE847eRpzxd&ust=1616409588240000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJCeyviZwe8CFQAAAAAdAAAAABAD')
User.create(email: 'black.cow@email.com', password: '123456', brand: true, company_name:'Black Cow', location: 'West Dorset', description: 'Spirits Maker', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.linkedin.com%2Fcompany%2Fthe-black-cow-vodka-company-limited&psig=AOvVaw2YtLBi8bh_lZvI-6gE2aMH&ust=1616409939363000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjelbSawe8CFQAAAAAdAAAAABAK')
User.create(email: 'fever@email.com', password: '123456', brand: true, company_name: 'Fever Tree', location: 'London', description: 'Soft Drinks Company', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.baldorfood.com%2Ffarms%2Ffever-tree-1&psig=AOvVaw1HhPRg7Z0m4nn1xSWrY2E6&ust=1616410004389000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjT8tOawe8CFQAAAAAdAAAAABAD')
User.create(email: 'magic@email.com', password: '123456', brand: true, company_name: 'Magic Rock', location: 'London', description: 'Beer Manufacturer', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.magicrockbrewing.com%2F&psig=AOvVaw0Vzu2Hl7eyt-rJ7XuoJchu&ust=1616410035395000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNClwuKawe8CFQAAAAAdAAAAABAN')
p User.create(email: 'fourpure@email.com', password: '123456', brand: true, company_name: 'Fourpure', location: 'London', description: 'Beer Manufacturer', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbristolcraftbeerfestival.co.uk%2Ffourpure-logo%2F&psig=AOvVaw2lyuabOVUvbrtzuR_ZO1Nt&ust=1616410058358000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjXre2awe8CFQAAAAAdAAAAABAD')
User.create(email: 'sacred@email.com', password: '123456', brand: true, company_name: 'Sacred Gin Ltd', location: 'London', description: 'Gin maker', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fsacredgin.com%2F&psig=AOvVaw0S9FdsbKxY7PHhzFg6PBcu&ust=1616410084355000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDugfqawe8CFQAAAAAdAAAAABAD')
User.create(email: 'exale@email.com', password: '123456', brand: true, company_name:'Exale Brewing', location: 'London', description: 'Beer Manufacturer', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funtappd.com%2FExaleBrewing&psig=AOvVaw02lgyHHr2HCtZctXeo-1C2&ust=1616410114447000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPjN14ibwe8CFQAAAAAdAAAAABAO')
User.create(email: 'boutinot@email.com', password: '123456', brand: true, company_name:'Boutinot Wines', location: 'London', description: 'Wine supplier', picture: 'https://www.google.com/url?sa=i&url=http%3A%2F%2Finnovativebeverages.ca%2Fboutinot-logo%2F&psig=AOvVaw2m1xeeZ-mcIdgHzrwuzto_&ust=1616410200700000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjZ0LGbwe8CFQAAAAAdAAAAABAD')
User.create(email: 'alliance@email.com', password: '123456', brand: true, company_name:'Alliance Wines', location: 'London', description: 'Wine supplier', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Falliancewine&psig=AOvVaw32ygKcGPpOe6sPFVqcw-vW&ust=1616410218928000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjxyrmbwe8CFQAAAAAdAAAAABAD')
User.create(email: 'flint@email.com', password: '123456', brand: true, company_name:'Flint Wines', location: 'London', description: 'Wine supplier', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fflintwines&psig=AOvVaw3BPSwz6zyBJ7aY9Aee26Bg&ust=1616410234135000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOj-1cCbwe8CFQAAAAAdAAAAABAD')
User.create(email: 'modal@email.com', password: '123456', brand: true, company_name:'Modal Wines', location: 'London', description: 'Wine supplier', picture: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fmodalwines&psig=AOvVaw3BOCrzu_hA6fIgwKZC0M06&ust=1616410252462000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLi2gcqbwe8CFQAAAAAdAAAAABAD')
User.create(email: 'thorman@email.com', password: '123456', brand: true, company_name:'Thorman Hunt', location: 'London', description: 'Wine supplier', picture:'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fthormanhunt&psig=AOvVaw1KjjFMUrFBFA92A52H481T&ust=1616410318994000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJCcvOmbwe8CFQAAAAAdAAAAABAD')
User.create(email: 'karma@email.com', password: '123456', brand: true, company_name: 'Karma Drinks', location: 'London', description: 'Soft Drinks Brand', picture:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fkarmadrinks.co%2Fuk%2F&psig=AOvVaw1t4HqeIbjFb-cr20YFrRw_&ust=1616410342384000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKCur_Sbwe8CFQAAAAAdAAAAABAD')



# LISTINGS
Listing.create(user_id: User.where(brand: false).sample.id, category: 'gin', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like to change the house gin', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'gin', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like to change the house gin', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'vodka', estimated_volume: 50, min_bid: 200, unit_type: 'bottles', description: 'Looking for a house vodka')
Listing.create(user_id: User.where(brand: false).sample.id, category: 'vodka', estimated_volume: 50, min_bid: 200, unit_type: 'bottles', description: 'Looking for a premium vodka')


Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'kegs', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'kegs', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'cans', description: 'My pub would like to change the beer offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'beer', estimated_volume: 200, min_bid: 400, unit_type: 'cans', description: 'Looking for handcreaft beer', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)


Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 100, min_bid: 200, unit_type: 'bottles', description: 'My pub would like house red for steak night', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)
Listing.create(user_id: User.where(brand: false).sample.id, category: 'wine', estimated_volume: 500, min_bid: 1000, unit_type: 'bottles', description: 'My pub would like to change the wine list offer in a very busy place', requirements: 'POS', deal_start_date: Date.current, deal_end_date: 30.days.from_now, auction_end_time: 1.days.from_now)

Listing.create(user_id: User.where(brand: false).sample.id, category: 'soft', estimated_volume: 1000, min_bid: 1500, unit_type: 'bottles', description: 'Looking for a new soft drinks supplier')
Listing.create(user_id: User.where(brand: false).sample.id, category: 'soft', estimated_volume: 2000, min_bid: 3000, unit_type: 'bottles', description: 'Looking for a new soft drinks supplier')



# BIDS

Listing.where(category: 'soft').each do |listing|
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Karma Drinks').id, amount: 2250, sweetner: 'POS poster')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 3125, sweetner: 'Sparkle barker')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 3370, sweetner: 'POS poster')
end

Listing.where(category:'vodka').each do |listing|
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Sacred Gin Ltd').id, amount: 250, sweetner: 'POS poster')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 125, sweetner: 'Sparkle barker')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 370, sweetner: 'POS poster')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Black Cow').id, amount:200, sweetner: 'Branded glassware')
end

Listing.where(category: 'gin').each do |listing|
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Sacred Gin Ltd').id, amount: 250, sweetner: 'POS poster')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 125, sweetner: 'Sparkle barker')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 370, sweetner: 'POS poster')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Black Cow').id, amount:200, sweetner: 'Branded glassware')
end

Listing.where(category: 'beer').each do |listing|
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Magic Rock').id, amount: 500, sweetner: 'free stock')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Fourpure').id, amount: 600, sweetner: 'branded glasses')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Exale Brewing').id, amount: 500, sweetner: 'Tshirts')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Enotria').id, amount: 300, sweetner:'Free stock')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Speciality Drinks').id, amount: 800, sweetner: 'training to staff')
end

Listing.where(category: 'wine').each do |listing|
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Boutinot Wines').id, amount: 1000, sweetner: 'staff training')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Flint Wines').id, amount: 500, sweetner: 'wine trips')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Alliance Wines').id, amount: 600, sweetner: 'free stock')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Modal Wines').id, amount: 300, sweetner: 'social media')
    Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Thorman Hunt').id, amount: 1000, sweetner: 'wine trips')
end
