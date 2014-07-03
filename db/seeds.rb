# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'test@test.com', password: 'test123123')

admin_user = User.create(email: 'admin@admin.com',
  password: 'admin123456',role: 'admin')

FoodTrucks::FetchTrucks.call


FoodTruck.find_each do |truck|
  FoodTrucks::LocateTruck.call(truck.id)
end
