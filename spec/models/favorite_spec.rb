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

require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
