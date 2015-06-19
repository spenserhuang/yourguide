# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
  username = Faker::Internet.user_name
  phones = [Faker::PhoneNumber.phone_number, Faker::PhoneNumber.phone_number]

  User.create(username: username, password: username, first_name: Faker::Name.first_name, middle_initial: [*('A'..'Z')].sample, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_numbers: phones, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
end

60.times do
  user = User.all.sample
  points = []

  5.times do
    points << [Faker::Address.latitude, Faker::Address.longitude]
  end

  tour = Tour.create(title: Faker::Company.catch_phrase, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, coordinates: points, video_url: Faker::Internet.url, photo_urls: [Faker::Internet.url, Faker::Internet.url], content: Faker::Lorem.paragraph)

  trailer = tour.create_trailer(description: Faker::Lorem.sentence(2), photo_url: Faker::Internet.url)

  5.times do
    author = user
    while author == user
      author = User.all.sample
    end

    comment = Comment.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)

    comment.author = user
    tour.comments << comment
    author.comments << comment
  end

  10.times do
    voter = user
    while voter == user
      voter = User.all.sample
    end

    vote = Vote.new(voter._id.to_s, tour._id.to_s, [true, false].sample).mongoize
    user.tour_votes.push(vote)
    tour.tour_votes.push(vote)
  end

  tour.user = user
  user.tours << tour
  user.save
  tour.save
end
