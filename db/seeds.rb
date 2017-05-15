require 'random_data'


 50.times do
   Wiki.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
