# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant, :class => 'Restaurants' do
    name "MyString"
    address "MyString"
    lat 1.5
    long 1.5
  end
end
