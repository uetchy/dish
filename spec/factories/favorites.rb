# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  lat        :float
#  lng        :float
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
    name "MyString"
    address "MyString"
    lat 1.5
    lng 1.5
  end
end
