# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do
  # binding.pry
  user = Faker::Internet.user_name
  phones = [Faker::Base.numerify('+90(###) ### ####'), Faker::Base.numerify('+90(###) ### ####')]
  User.create(username: user, password: user, first_name: Faker::Name.first_name, middle_initial: [*('A'..'Z')].sample, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_numbers: Faker::Base.numerify('+90(###) ### ####'), city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
end

50.times do
  points = []
  5.times do
    points << [Faker::Address.latitude, Faker::Address.longitude]
  end
  tour = Tour.create(title: Faker::Internet.catch_phrase, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, coordinates: points, video_url: Faker::Internet.url, photo_urls: [Faker::Internet.url, Faker::Internet.url], content: Faker::Lorem.paragraph)
  trailer = Trailer.create(description: Faker::Internet.sentences(2), photo_url: Faker::Internet.url)
  tour.trailer = trailer
  user = User.all.sample
  tour.user = user
  user.tours << tour
  user.save
  tour.save
end