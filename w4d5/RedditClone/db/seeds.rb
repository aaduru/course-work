# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do
#   Sub.create(title: Faker::Company.name, user_id: rand(1..2), description: Faker::Company.catch_phrase)
# end
#
# 50.times do
#   Post.create(title: Faker::Company.buzzword, user_id: rand(1..2), sub_id: rand(1..10), content: Faker::Company.bs, url: Faker::Company.logo)
# end

500.times do
  PostSub.create(post_id: rand(1..50), sub_id: rand(1..10))
end
