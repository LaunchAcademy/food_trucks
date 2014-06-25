# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_truck = FoodTruck.find_or_create_by(name: 'stokes1', description: 'This is at least a fifty-character description of a food truck.1',
  category: 'Pizza1')

user = User.find_or_create_by(email: 'test@test.com', password: 'test123123')

review = Review.find_or_create_by(user: user, food_truck: food_truck, rating: 4, body: 'This is at least a fifty-character description of a review')
