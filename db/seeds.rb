# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require 'faker'
10.times do
  name = Faker::Name.first_name
  User.create(email: "#{name}@gmail.com", password: "qwer4321")
end

admin = User.first
admin.position = "admin"
admin.save

staff = User.second
staff.position = "staff"
staff.save

