require 'faker'

10.times do
  User.create(
    :username => Faker::Commerce.color,
    :password => rand(1..5)
  )
end

10.times do
  Morsel.create(
    :user_id => rand(1..5),
    :sweet => Faker::Lorem.words(5)
  )
end
