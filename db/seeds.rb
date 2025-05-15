# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
["Alina", "Bill", "Sam"].each do |nickname|
  Owner.find_or_create_by!(nickname: nickname)
end

# Create Cars with different owners
[
  { brand: "Toyota", model: "Corolla", year: 2019, fuel: "Petrol", owner_nickname: "Alina" },
  { brand: "Ford", model: "Mustang", year: 2021, fuel: "Gasoline", owner_nickname: "Bill" },
  { brand: "Tesla", model: "Model 3", year: 2023, fuel: "Electric", owner_nickname: "Sam" }
].each do |car_attrs|
  owner = Owner.find_by(nickname: car_attrs[:owner_nickname])
  Car.find_or_create_by!(
    brand: car_attrs[:brand],
    model: car_attrs[:model],
    year: car_attrs[:year],
    fuel: car_attrs[:fuel],
    owner: owner
  )
end
