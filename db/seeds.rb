# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Cleaning DB of prev records'
Treehouse.destroy_all
User.destroy_all

puts 'Creating 5 users'

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  puts 'Created the users with the following attributes'
  puts "Name: #{user.first_name} #{user.last_name}"
  puts "Email: #{user.email}}"
  puts "Phone number: #{user.phone_number}"
  puts ''
end

puts 'Creating 10 treehouses'

10.times do
  treehouse = Treehouse.create(
    user_id: rand(1..5),
    name: Faker::Mountain.name,
    address: Faker::Address.full_address,
    price_per_night: Faker::Number.number(digits: 3),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
  puts 'Created the treehouse with the following attributes'
  puts "User ID: #{treehouse.user_id}"
  puts "Name: #{treehouse.name}"
  puts "Address: #{treehouse.address}"
  puts "Name: #{treehouse.price_per_night}"
  puts ''
  p treehouse.valid?
end

puts 'Finished!'
