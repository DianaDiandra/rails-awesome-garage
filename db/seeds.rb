# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "unsplash"

# Reset data
Favourite.destroy_all
Car.destroy_all
Owner.destroy_all


puts "Creating owners..."
["Alina", "Bill", "Sam"].each do |nickname|
  Owner.find_or_create_by!(nickname: nickname)
end

cars_data = [
  { brand: "Toyota", model: "Corolla", year: 2019, fuel: "Petrol", owner_nickname: "Alina" },
  { brand: "Ford", model: "Mustang", year: 2021, fuel: "Gasoline", owner_nickname: "Bill" },
  { brand: "Tesla", model: "Model 3", year: 2023, fuel: "Electric", owner_nickname: "Sam" },
  { brand: "BMW", model: "3 Series", year: 2022, fuel: "Diesel", owner_nickname: "Alina" },
  { brand: "Audi", model: "A4", year: 2020, fuel: "Gasoline", owner_nickname: "Bill" },
  { brand: "Mercedes-Benz", model: "C-Class", year: 2021, fuel: "Hybrid", owner_nickname: "Sam" },
  { brand: "Honda", model: "Civic", year: 2018, fuel: "Petrol", owner_nickname: "Alina" },
  { brand: "Hyundai", model: "Elantra", year: 2021, fuel: "Gasoline", owner_nickname: "Bill" },
  { brand: "Kia", model: "Sportage", year: 2022, fuel: "Petrol", owner_nickname: "Sam" },
  { brand: "Volkswagen", model: "Golf", year: 2020, fuel: "Diesel", owner_nickname: "Alina" }
]

puts "Creating cars with images from Unsplash..."

cars_data.each do |car_attrs|
  owner = Owner.find_by(nickname: car_attrs[:owner_nickname])

  # Search Unsplash for car image
  query = "#{car_attrs[:brand]} #{car_attrs[:model]}"
  image = Unsplash::Photo.search(query, 1).first
  image_url = image&.urls&.regular

  Car.create!(
    brand: car_attrs[:brand],
    model: car_attrs[:model],
    year: car_attrs[:year],
    fuel: car_attrs[:fuel],
    image_url: image_url,
    owner: owner
  )
end

Review.destroy_all

puts "Creating reviews..."

Car.all.each do |car|
  rand(2..5).times do
    Review.create!(
      car: car,
      comment: Faker::Lorem.sentence(word_count: 8),
      rating: rand(3..5)
    )
  end
end


puts "Seeding complete!"
