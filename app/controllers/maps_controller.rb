class MapsController < ApplicationController
  def index
  end

  def search(lat, lng, radius)
    client = Foursquare2::Client.new(
      client_id: 'FMYIKJ1EY5UOU03F4U02H1UYBCEYKJYB42IJS4TRYWEDDVXQ',
      client_secret: 'VW5DCCD3REEYGBZSFUB2HPOLXDJGAWPQAUTSYBOP4R5SVPAP',
      api_version: '20130815'
    )

  #   CLIENT_ID = 'FMYIKJ1EY5UOU03F4U02H1UYBCEYKJYB42IJS4TRYWEDDVXQ'
  #   CLIENT_SECRET = 'VW5DCCD3REEYGBZSFUB2HPOLXDJGAWPQAUTSYBOP4R5SVPAP'

  #   response = Faraday.get "https://api.foursquare.com/v2/venues/explore?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=20130815&ll=#{ll}&query=#{query}"
  # JSON.parse(response.body)

    response = client.search_venues(ll: [lat, lng].join(','), radius: radius)

    respond_to do |format|
      format.json {render :json => response["venues"].to_json}
    end
  end
end
