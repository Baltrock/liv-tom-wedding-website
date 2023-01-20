import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String}
    connect() {
      mapboxgl.accessToken = this.apiKeyValue;
      const map = new mapboxgl.Map({
      container: this.element, // container ID
      // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
      });
  }
}
