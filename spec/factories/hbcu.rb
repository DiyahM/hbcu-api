FactoryGirl.define do
  factory :hbcu do
    name FFaker::Education.school
    street_address FFaker::Address.street_address
    city FFaker::Address.city
    state 'California'
    zip_code '12345'
    latitude '-1'
    longitude '-1'
    mission_statement FFaker::Lorem.sentence
  end
end
