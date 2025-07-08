import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ['countries', 'materials', 'buyers', 'semaphore']
  
  connect() {
    console.log("CONNECT FILTER", this.countryTarget);
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
    new SlimSelect({
      select: "#buyers",   // this.element is the <select> tag
      showSearch: true,       // show search field
      settings: {
        placeholderText: 'Compradores',
        searchPlaceholder: 'Buscar',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
    new SlimSelect({
      select: "#req_company",   // this.element is the <select> tag
      showSearch: true,       // show search field
      settings: {
        placeholderText: 'Requisitos Empresa',
        searchPlaceholder: 'Buscar',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
    new SlimSelect({
      select: "#req_country",   // this.element is the <select> tag
      showSearch: true,       // show search field
      settings: {
        placeholderText: 'Requisitos País',
        searchPlaceholder: 'Buscar',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
    new SlimSelect({
      select: "#semaphore",   // this.element is the <select> tag
      showSearch: false,       // show search field
      settings: {
        placeholderText: 'Semáforo',
        allowDeselect: true   // allow deselecting (x) option
      }
    })
  }

  search(e) {
    let countries = [...this.countriesTarget.selectedOptions].map(o => o.value)
    let materials = [...this.materialsTarget.selectedOptions].map(o => o.value)
    let buyers = [...this.buyersTarget.selectedOptions].map(o => o.value)
    let semaphore = [...this.semaphoreTarget.selectedOptions].map(o => o.value)
    let url = new URL(window.location.protocol+"//"+window.location.hostname+(window.location.port.length !== 0 ? ":"+window.location.port : '')+"/")
    if ( materials.length > 0 ) {
      url.searchParams.append('materials', materials)
    }
    if ( countries.length > 0 ) {
      url.searchParams.append('countries', countries)
    }
    if ( buyers.length > 0 ) {
      url.searchParams.append('buyers', buyers)
    }
    if ( semaphore.length > 0 ) {
      url.searchParams.append('semaphore', semaphore)
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
