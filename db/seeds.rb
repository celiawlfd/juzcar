# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "cleaning database"
House.destroy_all
User.destroy_all

puts 'Creating 20 fake houses...'

user = User.new(
  username: "celiawilford",
  characteristic: "???",
  email: "celia@wilford.com",
  password: "123456"
)
user.save

puts user.valid?

names = [
  "Otter Landing on Santa Fe River, 13 private acres",
  "Drommen Shack - The Shack Tree",
  "Charming apartment on the seaside",
  "Magnificent apartment with sea views",
  "Panoramic View Villa in OliveGroves",
  "Entire home hosted by Wolfkop",
  "Rosewood Loft, Greyton",
  "Nice Villa in the close countryside",
  "Rancho Alto da Colina",
  "Reserva Embauva Cabana Jacaterão",
  "Casa Lamat",
  "Petite Maison Ancestrale City Centre",
  "Private beach cabin, Vashon Island",
  "NANATU amazing cabin at Parque Arvi Medellin",
  "Eco Cottage on Lake Atitlan",
  "TAMARINDO OCEANVIEW CABIN",
  "Cave Granado Guadix Granada",
  "Little love nest in Liddes",
  "Romantic stay where Tuscany meets the sky!",
  "Subterranean style & sweeping views"

]
addresses = [
  "116 Suwannee Ave SW, Branford, FL 32008, États-Unis",
  " K Club, Jalan Raya Cebok, Kedisan, Tegallalang, Kecamatan Ubud, Kabupaten Gianyar, Bali 80561, Indonésie",
  "Λουτράκι, Akrotiri 731 00, Grèce",
  "Citrusdal, 7340, Afrique du Sud",
  "12 Rue d'Agadir, Essaouira 44000, Maroc",
  "Overberg, Greyton, 6848, Afrique du Sud",
  "C. 7 Sur MZ. 730-LOTE 4, entre CALLE 6 SUR Y CALLE 8 SUR, La Veleta, 77760 Tulum, Q.R., Mexique",
  "Avenida mahahual Mz 20, Lt 3, Centro, 77976 Mahahual, Q.R., Mexique",
  "R. 900, 1300 - Sertãozinho, Itapema - SC, 88220-000, Brésil",
  "R. XV de Novembro, 205 - Centro, Orleans - SC, 88870-000, Brésil",
  "C. Jardín, 5, 18500 Guadix, Granada, Espagne",
  "Via S. rocco, 8, 55036 Sillico LU, Italie",
  "Rte Grand-Saint-Bernard 16, 1945 Liddes, Suisse",
  "C. Niño de Guevara, 4, 29008 Málaga, Espagne",
  "Central Ave 250, Guanacaste Province, Tamarindo, Costa Rica",
  "71 W Monroe St, Chicago, IL 60603, États-Unis",
  "Barrio 3, San Marcos La Laguna, Guatemala",
  "Santa Elena, Medellin, Antioquia, Colombie",
  "17601 Vashon Hwy SW, Vashon, WA 98070, États-Unis",
  "49 Rue Saint-Louis, Québec, QC G1R 3Z2, Canada"
]

descriptions = [
  "Spend all the time you want at home in Nature relaxing or recreating. This unique treehouse home is set high up in the trees and on 13 acres of natural habitat on the banks of the Santa Fe River. The Santa Fe has so much wildlife, and we are near the famous crystalline Ichetucknee River and miles of public trails. We share our kayaks, a canoe, and many amenities for your stay. So go for a solo paddle, join local guide trips to various springs, or hike on the property and at nearby parks.",
  "Relax under the bright Mediterranean sun, enjoy the magnificent Cretan landscape as well as a fantastic sea-view from this amazing villa, built at the foothill of mythical mount Ida amidst olive groves and sheep farms, in a quiet secluded village.",
  "Tranquil Getaway with all the modern comforts, 2 km from Balian, a well-known but uncrowded spot for surf & yoga. This 5-bedroom architectural designed house, fiberoptic, infinity pool, fully equipped kitchen, king-size beds, pool table, 52’’TV. Balian Retreat overlooks an impressive view of lush rice terraces, mountains and a pristine beach just 2min walk. Retreat & be mesmerized by nature, pink sunsets & ocean sounds.",
  "Spekboom is nestled into the fynbos reserve, the sweeping vistas from the terrace offer unparalleled views of the valley and mountains. It has 4 bedrooms all en-suite with indoor and outdoor fire places, eternity pool and outdoor jacuzzi.",
  "Exceptional villa, Dar ZINZIN is perched on a hill, with a breathtaking 360 ° view on the wild countryside of Essaouira, what to lose the North (we are facing south) and the reason ... So you will be ideally located 15 min by car from Essaouira, its medina by the sea,  and the pleasure of Kitesurfing too, only 15 min from the golf as well,  just 30 minutes to reach Sidi Kaouki and less than 1h30 for Imsouane for those who love surfing!",
  "Enjoy this cosy two bedroom loft with lounge area and separate entrance. Basic self-catering with bar fridge, microwave, kettle, cutlery and crockery. Beautiful views from all windows . Wall-to-wall carpets. Ideal for a quiet retreat or getaway. Restaurants and coffee shops short walking distance away. Greyton is at the foot of the Sonderend mountains with its nature reserve and many hiking and mountain bike trails. A feast for bird-watchers. New: back-up power for lights during load shedding.",
  "Casa Lamat 1 is the ONLY beach house located directly on the famous Mahahual Malecon! Unit #1 has a RUSTIC vibe and is located on the ground floor and features an oversized patio with plenty of hammocks to pass your days in. You can relax watching the birds and the boats passing by, play on your own private beach and then cool off in the fully air-conditioned interior. Kayaks, bicycles, boats, snorkeling, massages, shopping and the best restaurants all located within 5 minutes walking.",
  "Rancho Alto da Colina is located in the community of Rio Laranjeiras in the municipality of Orleans/SC, 11 km from the city center, where most of the route is by general road and asphalt. Beautiful and cozy place, ideal for disconnecting, resting and enjoying an incredible view of the Serra Geral.",
  "Escape to our cozy little bohemian house in Quebec City's historic Saint Roch neighborhood.  This charming space has unique decor, a cozy mezzanine, and a fully equipped kitchen.  Explore local cafes, boutiques, and landmarks just steps away.  Book now for a memorable stay!",
  "Charming private Vashon beach cottage. Get away from it all, unless you need it all, in which case you'd probably be happier in downtown Seattle. There's beach access and plenty of quiet at night. You can hear the water, the marine life and the birds. Vashon town is about 7 miles. Plenty of restaurants and interesting small shops. Pt. Robinson lighthouse is a short beach walk away. These pictures were taken early summer but some guests enjoy the winter.",
  "Enjoy the comfort and tranquility in a beautiful cabin next to Arvi Park fully equipped and with space for up to 4 people. The view is incomparable and the air is pure. An ideal place to free yourself from distractions, enjoy a natural environment, or to work. It is the perfect spot to disconnect and enjoy gorgeous landscapes. It has fast internet 200 MB, hot water, security, and good taste.",
  "This delightful cottage nestles you among fruit trees and aromatic herbs. The breathtaking view of Lake Atitlan is seen from every window. It is quiet, safe, and close to San Marcos. It is also Eco friendly, off the grid, and has pristine lake front with private beach and spacious private dock area.",
  "Enjoy staying at our comfortable couple bedroom located in Chinatown Chicago, 10 min away from Downtown Chicago. Fully furnished home with laundry in unit included all essentials amenities for your reservation. Centrally located neighborhood, 3 blocks away from parks, restaurants, grocery stores and public transportation. The bedroom comes with 1 bed, pillows, full set of bedsheet and towels. 42in 4k TV, Office desk and chair. Fully equipped kitchen and laundry (washer/dryer) available.",
  "Not your traditional tourist trap. Only 8 mins from Tamarindo by car, on a mountain ridge with ocean views.We have a 35 acre rescue farm, with horses, dogs, chickens, ducks, parrots and bunnies. PRIVATE PATIOS... with hammocks, tables, large cabins, with ocean views. Tons of parking. ",
  "The cave is fully equipped to live in it. It is in an old neighborhood that is being rehabilitated. It is for 5 people.The place is fascinating, a cannon overlooking the river Baul. Beautiful shared pool.",
  "Little Love Nest is a small barn renovated and equipped with love. This wonder is located at the foot of the slopes of Vichères Liddes, at the entrance to the combe of the A. You will find all the necessary comfort and absolute calm. Several hiking and walking routes are available without risk. Come and recharge your batteries in Bavon ! You won't regret it",
  "The property is located on top of a very panoramic hill, near the medieval village of Sillico where is located also a very good restaurant. Perfect accommodation for romantic couples, families with children with their dogs. Perfect place to relax but also suitable for guests who like active holiday with many exiting trekking, canyoning, mtb and horse riding excursions. Nice panoramic pool and view on the entire valley. Welcome where Tuscany meets the sky!",
  "Our lovely, quiet Balcony Cave is full of modern comforts and will be the highlight of your holiday. With a wide sunny terrace and a secret tunnel to an fantastic balcony, it has two double rooms, one twin, a full kitchen, bath and shower.",
  "The Water Tower at Long Meadow Farm, sits on the edge of an orchard and has spectacular views across the Warwickshire countryside. It has been converted into comfortable accommodation sleeping 4 in two bedrooms with ensuite bathrooms. Every attempt has been made to preserve the original components of the water tower . The construction company responsible for the conversion won a Federation of Master Builders regional award for the work. Described in the Daily Telegraph of 29 June 2019.",
  "We are on the doorstep of Winston Churchill’s home (Chartwell), Penshurst Place, Hever Castle, Chiddingstone and Emmett's Gardens. The local area is abundant with beautiful surrounding villages, such as Westerham, with restaurants, bars and old traditional pubs."
]

photos = [
  "https://i-mom.unimedias.fr/2020/09/16/je-decouvre-les-schtroumpfs.jpg?auto=format%2Ccompress&cs=tinysrgb&h=630&w=1200",
  "https://media.sudouest.fr/2005848/1000x500/so-5e92043166a4bd41734114ff-ph0.jpg?v=1586680700",
  "https://www.serieously.com/app/uploads/2021/05/les-schtroumpfs-1.jpg",
  "http://1.bp.blogspot.com/--krYl7IlP3g/TgL9SrliLaI/AAAAAAAAAGk/IU6pwJtuFF8/s1600/smurf-village-abu-dhabi.jpg",
  "http://cdn.supersoluce.com/file/docs/docid_4f719c178f152f5d66011408/elemid_4ee9fac00a2fe93e0e000014/thumb_1421316230-1.jpg",
  "https://www.dhnet.be/resizer/qlAJPE6T-KXD6RkuF6W83xwSXso=/1620x1080/filters:format(jpeg):focal(694.5x354:704.5x344)/cloudfront-eu-central-1.images.arcpublishing.com/ipmgroup/GVV23D7ZTVGVHLRWMMBQ63O43E.jpg",
  "http://www.topkool.com/fr/wp-content/uploads/2013/04/les-schtroumpfs-004.jpg",
  "https://bdi.dlpdomain.com/player/Q1XVCLOGs8Qn2onTecumT0zZGK5K2zPI-page3-1200.jpg",
  "https://www.pngitem.com/pimgs/m/13-139660_transparent-smurf-clipart-smurf-house-the-lost-village.png",
  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/de017638-1536-4590-ae5e-a00736692c58/d4kba3s-0fedd760-7d66-4e5e-b51f-d560acf64862.jpg/v1/fill/w_636,h_781,q_75,strp/a_smurf_house_02_by_the_torch_d4kba3s-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzgxIiwicGF0aCI6IlwvZlwvZGUwMTc2MzgtMTUzNi00NTkwLWFlNWUtYTAwNzM2NjkyYzU4XC9kNGtiYTNzLTBmZWRkNzYwLTdkNjYtNGU1ZS1iNTFmLWQ1NjBhY2Y2NDg2Mi5qcGciLCJ3aWR0aCI6Ijw9NjM2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.zV_dBqBZveBr2um017TtRm9BfCPBfYcYj74IKWdnvXY",
  "https://static.wikia.nocookie.net/smurfs/images/f/ff/Smurf_House.png/revision/latest?cb=20110912224438",
  "https://i.pinimg.com/originals/72/d3/4f/72d34f7064dd10030aba3118e9ff7e8d.jpg",
  "https://64.media.tumblr.com/40725d02fed294e1f3a731139e740a22/b85abdbf847c2e5a-85/s1280x1920/1a0dbd8ca7b98262f59e1827347a437d4e5e32ed.jpg",
  "https://www.pngkey.com/png/detail/210-2100283_smurfs-clipart-smurf-village-smurfs-house-png.png",
  "https://static.wikia.nocookie.net/smurfsvillage/images/2/2d/Brainy%27s_house.png/revision/latest?cb=20120430180847",
  "https://i.pinimg.com/originals/a0/df/a4/a0dfa4d2f88d6281fee38421d20a5b48.png",
  "https://static.wikia.nocookie.net/smurfsvillage/images/a/ad/Painter_Smurf.PNG/revision/latest?cb=20150307054238",
  "https://www.pngkey.com/png/full/304-3043636_mountains-blue-smurf-house.png",
  "https://static.wikia.nocookie.net/smurfs/images/9/97/Geologist_Smurf%27s_Hut.jpeg/revision/latest?cb=20150702231202",
  "https://static.wikia.nocookie.net/smurfs/images/1/15/Glow_Smurf_Grove_Hut.png/revision/latest?cb=20160604000022",
  "https://www.seekpng.com/png/full/419-4193353_smurf-smurfette-mountain-home-smurf-home.png"
]

100.times do |i|
  file = URI.open(photos[i])
  house = House.new(
    name: names[i],
    address: addresses[i],
    price_per_night: rand(1000..5000),
    number_of_people: rand(1..10),
    description: descriptions[i],
  )
  house.user = user
  house.photos.attach(io: file, filename: "house.png", content_type: "image/png")
  puts house.photos.attached?
  house.save
  puts "Creating id for : #{house[:id]}"
end
