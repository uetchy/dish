module ApplicationHelper
  def get4sq(path, args)
    data = Faraday.get URI.join("https://api.foursquare.com/v2/", path), {
      client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      v: 20130815
    }.merge(args)
    JSON.parse(data.body)
  end
end
