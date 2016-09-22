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

5.times { UserProfile.create(
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
  user_profile: UserProfile.find(1),
)

david = User.create(
  username: "david",
  password: "david",
  user_profile: UserProfile.find(2),
)

jesse = User.create(
  username: "jesse",
  password: "jesse",
  user_profile: UserProfile.find(3)
)

susi = User.create(
  username: "susi",
  password: "susi",
  user_profile: UserProfile.find(4)
)

sonia = User.create(
  username: "sonia",
  password: "sonia",
  user_profile: UserProfile.find(5)
)


category_1 = Category.create(name: "Writing Implements")
category_2 = Category.create(name: "Combinatory Tools")
category_3 = Category.create(name: "Composition Supplies")


# Writing Implements

Item.create(
  title: "Ballpoint Fountain Calligraphy Pen",
  description: "Handcrafted by a Master Pensmith with a perfectly waxed mustache. Pairs perfectly with our Hand-Tooled Moleskine Composition Notebook.",
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
  title: "Lead-Free Lead Pencil",
  description: "Our Lead-Free Lead Pencils are harvested from sustainably managed lead-free lead mines and local Spruce old-growth forests. All miners are housed in cage-free dormitories and are fed a steady diet of organic grains and produce.",
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
  title: "Felt-Tip Sharpie",
  description: "Organic, fair trade, and USDA certified cruelty-free Felt-Tip Sharpie.",
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
  title: "Vermilion Pen",
  description: "Our Vermilion Pen ink is characterized by dark, rich tannins and a bold, full mouth. The finish is earthy and slightly melodic. A suitable accompaniment to our Hand-Tooled Moleskine Composition Notebook",
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
  title: "Organic Vintage Stapler",
  description: "This handmade Organic Vintage Stapler is sourced locally from our carefully curated stapler farm partners.",
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
  title: "Hand-Forged Paperclip",
  description: "Forged by clip-smiths clad in lumberjack flannel. All blast furnaces used are cruelty-free. Available in Matte Chrome and Brushed Aluminum.",
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
  title: "Hand-Carved Artisanal Pushpin",
  description: "A return to 19th Century Pushpin craftsmanship. Each head is hand filed, buffed, and then polished by pushpin artisans.",
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
  title: "Vegan Staples",
  description: "Craft micro-batch production. Sustainably harvested from crowd-funded, micro-financed, locally sourced, international fair-trade producers.",
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
  title: "Hand-Tooled Moleskine Composition Notebook",
  description: "Moleskine parchment pages stretched and dried from non-endangered moles. Perfect for recording all of your most original and unironic ruminations.",
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
  title: "Italian Carrara Marble Notebook",
  description: "Hand-carved from our micro-credit-based, cruelty-free, vegan, organic, nonchalant, nonplussed notebook quarry.",
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
  title: "Vintage 1950's Legal Pad",
  description: "Basement fermented from San Francisco sourdough cultures. Certified Pre-Civil-Rights Era, soaked in the brine of injustice for thousands of years.",
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
  title: "Handcrafted Micronesian Post-It Notes",
  description: "Each purchase of our limited-edition Handcrafted Micronesian Post-It Notes equips three non-hipster Micronesian families with their very own Waddams Logo Life Raft. Consumer activism at its finest. You, too, can feel like you have changed the world even though you haven't done anything at all!",
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
