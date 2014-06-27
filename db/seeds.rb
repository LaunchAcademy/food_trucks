# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_truck = FoodTruck.create(name: 'stokes1', description: 'This is at least a fifty-character description of a food truck.1',
  category: 'Pizza1')

user = User.create(email: 'test@test.com', password: 'test123123')
admin_user = User.create(email: 'admin@admin.com', password: 'admin123456',role: 'admin')

review = Review.create(user: user, food_truck: food_truck, rating: 4,
  body: 'This is at least a fifty-character description of a review')

20.times do |truck_number|
  food_truck = FoodTruck.create(name: "Dumpling#{truck_number}",
    description: "This is at least a fifty-character description of a food truck.#{truck_number}",
    category: 'Dumplings')
end
