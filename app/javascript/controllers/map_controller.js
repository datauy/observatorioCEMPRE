import { Controller } from "@hotwired/stimulus"
import "leaflet"

export default class extends Controller { 
  static values = { orgId: Number }
  static total = 0
  static allLayers
  static currentLayer

  connect() {
    if ( typeof(window.mapa) === 'undefined' ) {
      window.Mapa = this;
      window.currentLayer = new L.FeatureGroup();
      window.mapa = L.map('map', {scrollWheelZoom: false}).setView([-34.897013, -56.171186], 13);
      L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', {
        maxZoom: 19,
        subdomains: 'abcd',
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>'
      }).addTo(window.mapa);
      window.mapa.zoomControl.setPosition('topright');
      this.load_markers(window.markers)
      currentLayer.addTo(window.mapa)
      window.mapa.flyToBounds(window.markers);
    }
  }
  load_markers(markers, initial = false) {
    console.log("LOAD MARKERS", markers);
    markers.forEach(marker => {
      let new_marker = L.marker(marker)
      new_marker.addTo(window.currentLayer)
    });
  }
}
