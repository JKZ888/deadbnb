# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Tomb.destroy_all
Graveyard.destroy_all
User.destroy_all

# generate the 30 graveyards

cities = %w[Lille Paris Lyon Grenoble Nantes Bordeaux Strasbourg Nancy Toulouse Montpellier Marseille]

graveyard_picture_urls = %w[
  http://pariseastvillage.com/wp-content/uploads/2016/02/cimetiere-pere-lachaise-paris-east-village-2.jpg
  http://www.cityzeum.com/images/lieu/bigstock-montmartre-cemetery-4120469.jpg
  http://www.lemainelibre.fr/sites/lemainelibre.fr/files/imagecache/detail/2016/11/02/photo-1478112232-462667.jpg
  http://images.midilibre.fr/images/2012/11/01/regis-huguet-fait-decouvrir-les-tombes-les-plus-celebres_468843_510x255.jpg
  http://pompesfunebresbordeaux.fr/wp-content/uploads/2015/06/cimetiere-de-la-chartreuse-bordeaux-1336750102.jpg
  http://img.20mn.fr/h8kHaQdTRQazVKSnZmz7Eg/1008x646_strasbourg-le-29-octobre-2015-cimetiere-saint-gall-statue-de-jean-georges-daniel-arnold.jpg
  http://www.lelyondesgones.com/photos_visites_Lyon/cimetieres/cimetiere_de_la_guillotiere/cimetiere_guillotiere%20(6).jpg
  http://static.ladepeche.fr/content/media/image/zoom/2007/08/25/200708251597.jpg
  http://france3-regions.francetvinfo.fr/auvergne-rhone-alpes/sites/regions_france3/files/styles/top_big/public/assets/images/2014/10/30/cimetiere_roch_le_pere_lachaise_grenoblois.jpg?itok=erTM4mau
  http://nancybuzz.fr/wp-content/uploads/2014/06/cimetiere-preville-nancy.jpg
  https://upload.wikimedia.org/wikipedia/commons/9/9e/Marseille-Saint-Pierre-cimeti%C3%A8re26.JPG
  ]

place_number_tab = (1..30).to_a

5.times do |graveyard|
  Graveyard.create!(
    city: cities.sample,
    nb_places: place_number_tab.sample,
    picture_graveyard: graveyard_picture_urls.sample)
end

# generate fake users

User.create(
  name:test
  birth_date:Faker::Date.between(34557.days.ago, Date.today),
  email: test@test.com,
  password: "password"
  )

10.times do |user|

User.create!(
  name: Faker::Superhero.name,
  birth_date: Faker::Date.between(34557.days.ago, Date.today),
  email: Faker::Internet.email,
  password: "password"
  )
end

# generate the tombs in the graveyards
price_info = (100..550).to_a

iteration_nb = 0

50.times do |tomb|

group_nb = iteration_nb+=1

  Tomb.create!(
  name_tomb: ("#{Faker::RockBand.name} #{group_nb}"),
  description: Faker::ChuckNorris.fact,
  price: price_info.sample,
  graveyard: Graveyard.all.sample,
  owner: User.all.sample)
end

# generate bookings

durations = [20, 40, 60, 80, 200]

50.times do |booking|

  Booking.create!(
  nb_persons: place_number_tab.sample,
  duration_years: durations.sample,
  epitaph: Faker::TwinPeaks.quote,
  tomb: Tomb.all.sample,
  user: User.all.sample)

end
