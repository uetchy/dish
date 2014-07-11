# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
    name "MyString"
    address "MyString"
    lat 1.5
    lng 1.5
  end
end
