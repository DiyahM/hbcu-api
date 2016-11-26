FactoryGirl.define do
  factory :hbcu do
    name FFaker::Education.school
    street_address FFaker::Address.street_address
  end
end
