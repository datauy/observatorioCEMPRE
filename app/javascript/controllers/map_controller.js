import { Controller } from "@hotwired/stimulus"
import "leaflet"

export default class extends Controller { 
  static values = { orgId: Number }
  static total = 0
  static allLayers
  static currentLayer

  connect() {
    if ( typeof(window.mapa) === 'undefined' ) {
      window.mapa = L.map('map', {scrollWheelZoom: false}).setView([-34.897013, -56.171186], 13);
      window.currentLayer = new L.FeatureGroup();
      L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', {
        maxZoom: 19,
        subdomains: 'abcd',
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>'
      }).addTo(window.mapa);
      window.mapa.zoomControl.setPosition('topright');
      this.load_markers()
      window.addEventListener('buyers_loaded', this.load_markers )
    }
  }
  load_markers() {
    var greenIcon = L.icon({
      iconUrl: '/images/icon.png',
      iconSize:     [24, 33], // size of the icon
      iconAnchor:   [12, 32], // point of the icon which will correspond to marker's location
      popupAnchor:  [0, -36] // point from which the popup should open relative to the iconAnchor
    });
    window.currentLayer.clearLayers()
    let bounds = []
    window.markers.forEach(marker => {
      console.log("LOAD MARKER", marker.coords)
      let new_marker = L.marker(marker.coords, {icon: greenIcon}).bindPopup(marker.name)
      new_marker.addTo(window.currentLayer)
      bounds.push(marker.coords)
    });
    currentLayer.addTo(window.mapa)
    window.mapa.flyToBounds(bounds)
  }
}
