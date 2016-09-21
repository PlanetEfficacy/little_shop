# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Item.destroy_all


# USER PROFILES

2.times { UserProfile.create(
    first_name:       Faker::Name.first_name,
    last_name:        Faker::Name.last_name,
    street_address:   Faker::Address.street_address,
    city:             Faker::Address.city,
    state:            Faker::Address.state,
    zipcode:          Faker::Address.zip,
  )
}

# USERS

admin = User.create(
  username: "admin",
  password: "admin",
  role: 1,
  user_profile: UserProfile.first,
)

david = User.create(
  username: "david",
  password: "david",
  user_profile: UserProfile.first,
)

jesse = User.create(
  username: "jesse",
  password: "jesse",
  user_profile: UserProfile.first
)

susi = User.create(
  username: "susi",
  password: "susi",
  user_profile: UserProfile.first
)

sonia = User.create(
  username: "sonia",
  password: "sonia",
  user_profile: UserProfile.first
)


category_1 = Category.create(name: "Writing Implements")
category_2 = Category.create(name: "Combinatory Tools")
category_3 = Category.create(name: "Composition Supplies")


# Writing Implements

Item.create(
  title: "Ballpoint Fountainhead Pen",
  description: "Crafted by a master pensmith with waxed mustache. Pairs perfectly with our craft moleskin composition notebook.",
  image_url: "https://images-na.ssl-images-amazon.com/images/G/02/aplusautomation/vendorimages/aa440052-d253-49d7-ad9e-6db1e33168ec.jpg._CB315741042__SL300__.jpg",
  price: 275.99,
  categories: [category_1],
  reviews: [Review.create(
            stars: 1,
            body: Faker::Hipster.paragraphs.first,
            user: david ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 3,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Lead Pencil",
  description: "Our lead pencils are harvested from sustainably managed lead mines and local Spruce old wood forrests. All miners are housed in cage-free dormitories.",
  image_url: "http://www.medicalinspection.net/wp-content/uploads/2011/01/Lead-of-a-pencil.jpg",
  price: 55.99,
  categories: [category_1],
  reviews: [Review.create(
            stars: 1,
            body: Faker::Hipster.paragraphs.first,
            user: david ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 3,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Felt Tip Sharpie",
  description: "Organic, fair trade, and cruelty free certified felt tip sharpie.",
  image_url: "http://cdn.dick-blick.com/items/213/83/21383-2020-2ww-m.jpg",
  price: 314.00,
  categories: [category_1],
  reviews: [Review.create(
            stars: 1,
            body: Faker::Hipster.paragraphs.first,
            user: david ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 3,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Red Pen",
  description: "Our red pen ink is characterized by dark, rich, tanins, with a bold, full mouth, earthy and slightly melodic finish.",
  image_url: "http://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_300x300/ST430M2OW_staedtler_ky_staed_430_bp_pen_med_rd_red.jpg",
  price: 241.00,
  categories: [category_1],
  reviews: [Review.create(
            stars: 1,
            body: Faker::Hipster.paragraphs.first,
            user: david ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 3,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

# Combinatory Tools

Item.create(
  title: "Vintage Stapler",
  description: "This handmade, organic staplers are sourced locally from our carefully curated stapler farm partners.",
  image_url: "https://images-na.ssl-images-amazon.com/images/I/41vxxkR86xL._SY300_.jpg",
  price: 1275.99,
  categories: [category_2],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Paperclip",
  description: "Forged by clip-smithies dressed in lumberjack flannels using cruelty-free blast furnaces. Available in matte chrome.",
  image_url: "https://images-na.ssl-images-amazon.com/images/I/41KIDb%2BE%2BmL._SY300_.jpg",
  price: 175.99,
  categories: [category_2],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Pushpin",
  description: "A return to nineteenth century pushpin craftsmanship. Each head is hand filed, buffed, and then polished by pushpin artisans.",
  image_url: "http://img0014.popscreencdn.com/131012922_amazoncom-anchor-wire-122643-16pk-push-pins-assorted-.jpg",
  price: 77.99,
  categories: [category_2],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

Item.create(
  title: "Staples",
  description: "Craft micro-batch production sustainably harvested from crowd-funded, micro-financed, locally sourced, international fair trade producers.",
  image_url: "https://images-na.ssl-images-amazon.com/images/I/41AltANZFwL._SY300_.jpg",
  price: 415.00,
  categories: [category_2],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: susi )]
)

# Composition Supplies

Item.create(
  title: "Moleskine",
  description: "Moleskine parchment pages stretched and dried from non-endangered moles.",
  image_url: "https://dvf5h65su8dqt.cloudfront.net/Moleskine/Images/Catalog/8051272891294_02-PRDL.JPG",
  price: 1275.99,
  categories: [category_3],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: david )]
)

Item.create(
  title: "Marble Notebook",
  description: "Handpicked through our micro-credit based cruelty-free, vegan, organic, nonchalant notebook distillery.",
  image_url: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=68157901",
  price: 75.99,
  categories: [category_3],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: david )]
            )

Item.create(
  title: "Legal Pad",
  description: "Basement fermented from San Francisco sour dough cultures.",
  image_url: "https://images-na.ssl-images-amazon.com/images/I/41swz2uYGJL._SY300_.jpg",
  price: 89.99,
  categories: [category_3],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: david )]
            )

Item.create(
  title: "Post-it",
  description: "Every Post-it purchased equips three non-hipster families with their very own artisnal, craft, post it note. Consumer activism at its finest.",
  image_url: "http://s3-ap-southeast-2.amazonaws.com/wc-prod-pim/JPEG_300x300/3M16043476_C_post_it_notes_yellow_12_pack.jpg",
  price: 415.00,
  categories: [category_3],
  reviews: [Review.create(
            stars: 2,
            body: Faker::Hipster.paragraphs.first,
            user: jesse ),
           Review.create(
            stars: 4,
            body: Faker::Hipster.paragraphs.first,
            user: sonia ),
           Review.create(
            stars: 5,
            body: Faker::Hipster.paragraphs.first,
            user: david )]
            )






# 2.times { Category.create(
#    name: Faker::Commerce.product_name
#   )}
#
# 6.times { Item.create(
#   title: Faker::Commerce.product_name,
#   description: Faker::Hipster.sentence,
#   image_url: Faker::Placeholdit.image,
#   price: (Faker::Commerce.price.to_f * 1000).to_s,
#   categories: Category.where(name: Category.first.name)
#   ) }
#
# 6.times { Item.create(
#   title: Faker::Commerce.product_name,
#   description: Faker::Hipster.sentence,
#   image_url: Faker::Placeholdit.image,
#   price: (Faker::Commerce.price.to_f * 1000).to_s,
#   categories: Category.where(name: Category.last.name)
#   ) }



# Item.each do |item|
#   if item.id.even?
#     Category.first.
#   else
#     Category.last.
#   end


# end
