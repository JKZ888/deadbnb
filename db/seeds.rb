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
place_number_tab = (1..30).to_a

5.times do |graveyard|
  Graveyard.create!(city: cities.sample, nb_places: place_number_tab.sample)
end

# generate fake users

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




