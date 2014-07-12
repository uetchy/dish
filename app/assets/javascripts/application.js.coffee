# = require jquery
# = require jquery_ujs
# = require turbolinks
# = require_tree .

list = $('#js-list')

map = L.mapbox.map('map', 'oame.iiciaej1').setView([35.685175, 139.752799], 10).addControl(L.mapbox.geocoderControl('oame.iiciaej1'));

featureGroup = L.featureGroup().addTo(map)

drawControl = new L.Control.Draw({
  edit: {
    featureGroup: featureGroup
  },
  draw: {
    polygon: false,
    polyline: false,
    rectangle: false,
    circle: true,
    marker: false
  }
}).addTo(map)

showPolygonArea = (e) ->
  radius = e.layer.getRadius()
  lat = e.layer.getLatLng().lat
  lng = e.layer.getLatLng().lng

  list.empty()
  list.append $('<li>').append("<b>Searching...</b>")

  $.ajax(
    type: 'GET',
    url: "/search.json?lat=#{lat}&lng=#{lng}&radius=#{radius}",
    dataType: 'json',
    success: (json) ->
      list.empty()
      $.each json, (i, v) ->
        photo = v['venue']['photos']['groups'][0]['items'][0]
        photo_url = [ photo['prefix'], '300x500', photo['suffix'] ].join('')
        list.append $('<li>').append("<h3>#{v['venue']['name']}</h3><br/><img src='#{photo_url}' />")
  )

  featureGroup.clearLayers()
  featureGroup.addLayer(e.layer)

showPolygonAreaEdited = (e) ->
  e.layers.eachLayer (layer) -> showPolygonArea({ layer: layer })

map.on 'draw:created', showPolygonArea
map.on 'draw:edited', showPolygonAreaEdited
