# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
tea1= Tea.create!(title: "Black Tea", description: "English Black Tea", temperature: 90, brew_time: 3)
tea2= Tea.create!(title: "Green Tea", description: "Asian Green Tea", temperature: 90, brew_time: 3)
tea3= Tea.create!(title: "White Tea", description: "Asian White Tea with Pomegranate", temperature: 80, brew_time: 5)

customer1 = Customer.create!(first_name: "Blaine", last_name: "Kennedy", email: "bk@gmail.com", address: "111 Main Street, Great Falls, MT 59404")
customer2 = Customer.create!(first_name: "Leigh", last_name: "Larson", email: "ll@gmail.com", address: "222 Main Street, Great Falls, MT 59404")

Subscription.create!(title: "Black Tea Sub", price: 50, status: 0, frequency: 30, customer_id: customer1.id, tea_id: tea1.id)
Subscription.create!(title: "Green Tea Sub", price: 25, status: 1, frequency: 60, customer_id: customer1.id, tea_id: tea2.id)
Subscription.create!(title: "Lemon Ginger Sub", price: 10, status: 0, frequency: 7, customer_id: customer2.id, tea_id: tea3.id)