FactoryGirl.define do
  factory :wiki do
    title Faker::Commerce.product_name
    body Faker::Company.bs
    private false
    user 
  end
end
