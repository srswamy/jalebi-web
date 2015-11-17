# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OrderStatus.delete_all
OrderStatus.create! id: 1, status: "Received"
OrderStatus.create! id: 2, status: "In Process"
OrderStatus.create! id: 3, status: "Picked Up"
OrderStatus.create! id: 4, status: "Delivered"
OrderStatus.create! id: 5, status: "Cancelled"

Unit.delete_all
Unit.create! id: 1, name: "ea"
Unit.create! id: 2, name: "100g"
Unit.create! id: 3, name: "250g"
Unit.create! id: 4, name: "500g"
Unit.create! id: 5, name: "1kg"
Unit.create! id: 6, name: "100ml"
Unit.create! id: 7, name: "250ml"
Unit.create! id: 8, name: "500ml"
Unit.create! id: 9, name: "1L"
