require 'faker'

puts 'Cleaning DB'
Flat.destroy_all

puts 'Creating flats...'

4.times do
  @flat = Flat.new(
    name: Faker::Artist.name,
    address: Faker::Address.full_address,
    description: Faker::Travel::TrainStation.name,
    price_per_night: rand(50..150),
    number_of_guests: rand(1..6)
  )
  @flat.save
end
puts 'Finished!'
