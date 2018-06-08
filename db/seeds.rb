# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User

User.destroy_all

u1 = User.create username: "Anna", email: "anna@ga.com", password: "chicken", password_confirmation: "chicken", bio: "Most generous girl"
u2 = User.create username: "Bagi", email: "bagi@ga.com", password: "chicken", password_confirmation: "chicken", bio: "Happy always"
u2 = User.create username: "Linna", email: "linna@ga.com", password: "chicken", password_confirmation: "chicken", bio: "hard worker"

puts "Created #{ User.all.length } Users"
