# = require jquery
# = require jquery_ujs
# = require turbolinks
# = require_tree .

list = $('#js-list')

map = L.mapbox.map('map', 'oame.iiciaej1').setView([35.685175, 139.752799], 10)

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

  $.ajax(
    type: 'GET',
    url: "/search.json?lat=#{lat}&lng=#{lng}&radius=#{radius}",
    dataType: 'json',
    success: (json) ->
      $.each json, (i, v) ->
        list.append $('<li>').append(v["name"])
  )

  featureGroup.clearLayers()
  featureGroup.addLayer(e.layer)

showPolygonAreaEdited = (e) ->
  e.layers.eachLayer (layer) -> showPolygonArea({ layer: layer })

map.on 'draw:created', showPolygonArea
map.on 'draw:edited', showPolygonAreaEdited
