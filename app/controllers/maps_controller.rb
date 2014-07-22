class MapsController < ApplicationController
  include ApplicationHelper

  respond_to :json

  def index
  end

  def search(lat, lng, radius)
    data = get4sq 'venues/explore',
                  ll: [lat, lng].join(','),
                  radius: radius,
                  venuePhotos: 1,
                  section: 'food'

    response = data['response'].present? ? data['response']['groups'][0]['items'] : []
    respond_with response
  end
end
