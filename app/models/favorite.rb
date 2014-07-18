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

class Favorite < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
end
