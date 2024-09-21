# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create root account
root = Account.create!(name: "Sal Army")

# Create division accounts
east = Account.create!(name: "East Division", parent: root)
west = Account.create!(name: "West Division", parent: root)
north = Account.create!(name: "North Division", parent: root)
south = Account.create!(name: "South Division", parent: root)

# Create city accounts under East Division
chicago = Account.create!(name: "Chicago", parent: east)
detroit = Account.create!(name: "Detroit", parent: east)
ny_city = Account.create!(name: "New York City", parent: east)
florida = Account.create!(name: "Florida", parent: east)

# Create users
User.create!(username: "root_user", password: "password", account: root)
User.create!(username: "east_user", password: "password", account: east)
User.create!(username: "chicago_user", password: "password", account: chicago)

# Create donations
Donation.create!(amount: 1000, account: chicago)
Donation.create!(amount: 1500, account: detroit)
Donation.create!(amount: 2000, account: ny_city)
Donation.create!(amount: 1800, account: florida)