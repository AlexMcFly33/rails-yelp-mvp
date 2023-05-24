require 'faker'

category = ["chinese", "italian", "japanese", "french", "belgian"]

puts 'Creating 5 fake restaurants...'
10.times do
  restaurant = Restaurant.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    category:  category.sample
  )
  restaurant.save!
end
puts 'Finished!'
