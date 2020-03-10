# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'


puts 'Creating 5 profiles...'
5.times do |i|
  bios = [Faker::Quote.yoda, Faker::TvShows::Simpsons.quote,
    Faker::TvShows::RickAndMorty.quote,
    Faker::TvShows::BojackHorseman.quote,
    Faker::Quote.famous_last_words,
    Faker::Quotes::Shakespeare.hamlet_quote,
    Faker::GreekPhilosophers.quote]

  user_test = User.new(
    name: "#{Faker::Name.unique.name}" + " " + "#{Faker::Name.unique.last_name}",
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    bio: bios.sample,
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: "123456",
    password_confirmation: "123456",
    latitude: rand(-90..90),
    longitude: rand(-180..80)
  )
  user_test.save!
  puts "#{i + 1}. #{user.name}"
end

puts 'Creating grows...'
User.all.each do |user| #way to conect the fakeGrow to fakeUser
  plants = [Faker::Food.fruits, Faker::Food.spice, Faker::Food.vegetables]
  grow_test = Grow.new(
    name: plants.sample,
    description: Faker::Food.description,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    indoors: Faker::Boolean.boolean,
    user: user
    )
  grow_test.save!
end

puts 'Creating 5 posts...'
User.all.each do |user|
  5.times do |i|
    content = [Faker::SlackEmoji.people,
    Faker::SlackEmoji.nature,
    Faker::SlackEmoji.celebration,
    Faker::SlackEmoji.emoji,
    Faker::Hipster.paragraph(sentence_count: 2),
    Faker::Cannabis.buzzword,
    Faker::Cannabis.health_benefit,
    Faker::Cannabis.medical_use,
    Faker::BossaNova.song,
    Faker::GreekPhilosophers.quote
    ]
    post = Post.new(
      content: content.sample,
      user: user,
      grow: Grow.all.sample
    )
  end
end

puts 'Creating 3 groups...'
3.times do |i|
  plants = [Faker::Food.fruits, Faker::Food.spice, Faker::Food.vegetables]
  grow = Grow.new(
    name: plants.sample,
    description: Faker::Food.description,
    location: "#{Faker::Address.city}, #{Faker::Address.country}",
    private: Faker::Boolean.boolean,
    user: User.all.sample
    )

end


