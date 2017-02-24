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

cities = %w[Lille Paris Lyon Grenoble Nantes Bordeaux Strasbourg Nancy Toulouse Montpellier Marseille LasVegas NewYork SanFrancisco]

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

20.times do |graveyard|
  Graveyard.create!(
    city: cities.sample,
    nb_places: place_number_tab.sample,
    picture_graveyard: graveyard_picture_urls.sample)
end

# generate fake users

User.create(
  name:"test",
  birth_date: Faker::Date.between(34557.days.ago, Date.today),
  email: "test@test.com",
  password: "password"
  )

15.times do |user|

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


tomb_picture_urls = %w[https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUveoCikiCo3wqEgBrwOwyjzsQ7KnNqk1W_bWGHtP-za4XQhAB]

50.times do |tomb|

group_nb = iteration_nb+=1

  Tomb.create!(
  name_tomb: ("#{Faker::RockBand.name} #{group_nb}"),
  description: Faker::ChuckNorris.fact,
  price: price_info.sample,
  graveyard: Graveyard.all.sample,
  # picture_tomb: tomb_picture_urls.sample,
  owner: User.all.sample
  )
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


# http://www.shximai.com/data/out/89/67937425-grave-wallpapers.jpg
# http://www.wallpaperup.com/uploads/wallpapers/2012/12/01/23138/big_thumb_bc4e2e14eb1e744f8a58d9776532a257.jpg
# http://www.wallpaperup.com/uploads/wallpapers/2013/03/30/68061/d403e9d3cf9a2d8c8fe0a02c432f400d.jpg
# http://www.wallpaperup.com/uploads/wallpapers/2014/01/13/226402/big_thumb_d7238a5e1180c578b1ed92233d474b06.jpg
# http://www.wallpaperup.com/uploads/wallpapers/2013/04/08/72353/big_thumb_fa35dc5581d56bc5bc368e1f3e55aad5.jpg
# http://img04.deviantart.net/b730/i/2008/037/5/b/grave_by_raven30hell.jpg
# http://img15.deviantart.net/7ae9/i/2015/127/3/4/celtic_grave_by_worldii-dx27jg.jpg
# http://img04.deviantart.net/d836/i/2004/148/2/a/grave.jpg
# http://img06.deviantart.net/89df/i/2008/268/5/7/sambo__s_grave_by_andrewfphoto.jpg
# http://img10.deviantart.net/9299/i/2007/318/9/8/grave_by_brinnswf.jpg
# http://pre08.deviantart.net/fd95/th/pre/i/2011/051/b/c/graves_104_quaddles_by_quaddles-d29zgcp.jpg
# http://orig06.deviantart.net/5c7e/f/2008/045/4/5/gravestones_by_fbuk.jpg
# http://img08.deviantart.net/0b34/i/2008/116/8/e/grave_and_angel___2_by_khol363.jpg
# http://orig13.deviantart.net/5dcc/f/2014/237/e/3/moor9d_by_wyldraven-d7wlx9q.jpg
# http://img09.deviantart.net/789c/i/2005/015/e/6/the_moon_is_so_beutiful_tonght_by_suzi9mm.jpg
# http://img09.deviantart.net/535d/i/2014/202/f/9/i_ching_28___da_guo__great_preponderance__by_annewipf-d7rnrbs.jpg
# http://cdn.quotesgram.com/img/20/62/1348286193-adamthinksgraves.jpg
# http://wiki-buzz.fr/wp-content/uploads/2013/01/toldo.jpg
