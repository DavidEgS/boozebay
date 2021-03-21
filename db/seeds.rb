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

pubs_pictures = [
  'https://png.pngitem.com/pimgs/s/121-1219746_logo-de-pub-png-transparent-png.png',
  'https://banner2.cleanpng.com/20180514/xpw/kisspng-pub-on-the-cedar-logo-bar-cider-5af966ab078217.1486248515262941870308.jpg',
  'https://images-platform.99static.com//OJgt3FhZMNRIU0BdY7uVq0kYbkk=/277x1440:1043x2206/fit-in/500x500/99designs-contests-attachments/67/67025/attachment_67025375',
  'https://images-platform.99static.com//A67IBdGosEogkI8qLXla0zHFYIE=/234x0:990x756/fit-in/500x500/99designs-contests-attachments/98/98320/attachment_98320987',
  'https://vanimg.s3.amazonaws.com/bar-logos-14.jpg',
  'https://i.pinimg.com/originals/4b/92/65/4b9265a935c48a98d585c7a6fb165e01.jpg',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/07/attachment_43377987-e1560831887787.png?auto=format&q=60&fit=max&w=930',
  'https://images-platform.99static.com//3DTH2HJNY9QnX8HXBtG6sfScyfQ=/543x73:1248x778/fit-in/500x500/99designs-contests-attachments/88/88532/attachment_88532157',
  'https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/07/attachment_52575027-e1562319538455.jpeg?auto=format&q=60&fit=max&w=930',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDjiQSMbzcXUHIqSdBmLZZHR9tBK3CWn-edA&usqp=CAU',
  'https://i.pinimg.com/originals/71/a8/ba/71a8baae8529c3d43b4a5010320359f9.jpg',
  'https://www.vandelaydesign.com/wp-content/uploads/bar-pub-logos.jpg',
  'https://cdn.dribbble.com/users/2223870/screenshots/11612491/media/4135283af740478ff7935c95b1157db0.jpg?compress=1&resize=400x300',
  'https://cms-assets.tutsplus.com/uploads/users/151/posts/32935/preview_image/bar-logo-preview.jpg',
  'https://bpando.org//wp-content/uploads/02_The_Tokenhouse_Logo_Designers_Anonymous_on_BPO.jpg'
]

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
User.create(email: 'enotria@email.com', password: '123456', brand: true, company_name: 'Enotria', location: 'London', description: 'Drinks Trade company', picture: 'https://spinachbranding.com/wp-content/uploads/2017/09/Enotria.png')
User.create(email: 'speciality@email.com', password: '123456', brand: true, company_name: 'Speciality Drinks', location: 'London', description: 'Drinks Trade company', picture: 'https://www.iabuk.com/sites/default/files/styles/company_logo_280x280/public/company_logo/Specalist.png?itok=_CuPFvp5')
User.create(email: 'black.cow@email.com', password: '123456', brand: true, company_name:'Black Cow', location: 'West Dorset', description: 'Spirits Maker', picture: 'https://cdn-live.thegbexchange.com/static/uploads/producers/logo-4356-BlackCow_Smooth_Cow_Logo_AW.png')
User.create(email: 'fever@email.com', password: '123456', brand: true, company_name: 'Fever Tree', location: 'London', description: 'Soft Drinks Company', picture: 'https://w7.pngwing.com/pngs/90/3/png-transparent-fever-tree-logo-tonic-water-drink-mixer-fever-tree-gin-and-tonic-fever-text-logo-cocktail.png')
User.create(email: 'magic@email.com', password: '123456', brand: true, company_name: 'Magic Rock', location: 'London', description: 'Beer Manufacturer', picture: 'https://www.magicrockbrewing.com/app/uploads/2018/10/MRB-LOGO-BLACK-CIRCLE-01.jpg')
User.create(email: 'fourpure@email.com', password: '123456', brand: true, company_name: 'Fourpure', location: 'London', description: 'Beer Manufacturer', picture: 'https://www.cheersbro.co.uk/content/uploads/2019/08/Fourpure-Brewing-Co.png')
User.create(email: 'sacred@email.com', password: '123456', brand: true, company_name: 'Sacred Gin Ltd', location: 'London', description: 'Gin maker', picture: 'https://www.ginfoundry.com/wp-content/uploads/2013/10/SacredGin-logo-min.jpg')
User.create(email: 'exale@email.com', password: '123456', brand: true, company_name:'Exale Brewing', location: 'London', description: 'Beer Manufacturer', picture: 'https://untappd.akamaized.net/site/brewery_logos_hd/brewery-444716_84d05_hd.jpeg')
User.create(email: 'boutinot@email.com', password: '123456', brand: true, company_name:'Boutinot Wines', location: 'London', description: 'Wine supplier', picture: 'https://boutinot.com/wp-content/themes/boutinot/images/new-logo.png')
User.create(email: 'alliance@email.com', password: '123456', brand: true, company_name:'Alliance Wines', location: 'London', description: 'Wine supplier', picture: 'https://www.alliancewine.com/Layout/footer_logo.png')
User.create(email: 'liberty@email.com', password: '123456', brand: true, company_name:'Liberty Wines', location: 'London', description: 'Wine supplier', picture: 'http://cdn.shopify.com/s/files/1/1550/5377/files/liberty_logo_large.jpg?v=1495099646')
User.create(email: 'modal@email.com', password: '123456', brand: true, company_name:'Modal Wines', location: 'London', description: 'Wine supplier', picture: 'https://cdn.shopify.com/s/files/1/0362/6758/9770/files/ModalCorkFinal.png?height=628&pad_color=ffffff&v=1586049088&width=1200')
User.create(email: 'thorman@email.com', password: '123456', brand: true, company_name:'Thorman Hunt', location: 'London', description: 'Wine supplier', picture:'https://media-exp1.licdn.com/dms/image/C4D0BAQFxGyf4BfnghQ/company-logo_200_200/0/1536219771487?e=1624492800&v=beta&t=193QjGWHOViwFvF2VR_N-znJfoSkg65c-3oK0iuKMk8')
User.create(email: 'karma@email.com', password: '123456', brand: true, company_name: 'Karma Drinks', location: 'London', description: 'Soft Drinks Brand', picture:'https://spiritstore.co.uk/media/Manufacturer/karma_new_logo.png')

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
  Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Liberty Wines').id, amount: 500, sweetner: 'wine trips')
  Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Alliance Wines').id, amount: 600, sweetner: 'free stock')
  Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Modal Wines').id, amount: 300, sweetner: 'social media')
  Bid.create(listing_id: listing.id, user_id: User.find_by(company_name: 'Thorman Hunt').id, amount: 1000, sweetner: 'wine trips')
end
