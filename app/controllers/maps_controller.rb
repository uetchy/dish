class MapsController < ApplicationController
  def index
  end

  def search(lat, lng, radius)
    data = Faraday.get "https://api.foursquare.com/v2/venues/explore?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&v=20130815&ll=#{[lat, lng].join(',')}&radius=#{radius}&venuePhotos=1&section=food"
    response = JSON.parse(data.body)['response']['groups'][0]['items']

    # response = client.search_venues(ll: [lat, lng].join(','), radius: radius)

    respond_to do |format|
      format.json {render :json => response.to_json}
    end
  end
end
