import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

// Connects to data-controller="prices"
export default class extends Controller {
 
  static targets = ['countries', 'materials']
  
  connect() {
    console.log("CONNECT PRICES", this.countriesTarget);
    new SlimSelect({
      select: "#countries",   // this.element is the <select> tag
      showSearch: true,       // show search field
      settings: {
        placeholderText: 'País',
        searchPlaceholder: 'Buscar',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
    new SlimSelect({
      select: "#materials",   // this.element is the <select> tag
      showSearch: true,       // show search field
      settings: {
        placeholderText: 'Materiales',
        searchPlaceholder: 'Buscar',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
  }

  search(e) {
    let countries = [...this.countriesTarget.selectedOptions].map(o => o.value)
    let materials = [...this.materialsTarget.selectedOptions].map(o => o.value)
    let url = new URL(window.location.protocol+"//"+window.location.hostname+(window.location.port.length !== 0 ? ":"+window.location.port : '')+"/precios")
    if ( materials.length > 0 ) {
      url.searchParams.append('materials', materials)
    }
    if ( countries.length > 0 ) {
      url.searchParams.append('countries', countries)
    }
    fetch(url.href, {
      method: "GET",
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => {
      Turbo.renderStreamMessage(html)
    })
  }
}
