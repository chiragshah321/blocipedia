require 'rubygems'
require 'faker'

 
 50.times do
   User.create!(
     email:   Faker::Internet.email,
     password: "password"
   )
 end
 
users = User.all
 
 50.times do
   Wiki.create!(
     title:  Faker::Commerce.product_name,
     body:   Faker::Company.bs,
     user: users.sample
   )
 end
 
 
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
