import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

// Connects to data-controller="filters"
export default class extends Controller {
  static targets = ['country']
  
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
    console.log("SEARCH", this.countryTarget);
    /*if ( event !== null ) {
      //Handle filters
      let cat = event.target.dataset.category;
      let value = event.target.dataset.value;
      if ( cat == 'text' ) {
        window.active_filters[cat] = document.getElementById('search-text').value
      }
      else {
        if ( event.target.classList.contains('active') ) {
          window.active_filters[cat].splice(window.active_filters[cat].indexOf(value), 1);
        }
        else {
          window.active_filters[cat].push(value);
        }
        event.target.classList.toggle('active');
      }
    }
    // Create URL
    let url = new URL(window.location.protocol+"//"+window.location.hostname+(window.location.port.length !== 0 ? ":"+window.location.port : '')+"/search");
    Object.keys(window.active_filters).forEach( cat => {
      if ( window.active_filters[cat].length ) {
        if ( cat == 'text' ) {
          if (window.active_filters[cat].length > 2 )
            url.searchParams.append(cat, window.active_filters[cat]);
        }
        else {
          url.searchParams.append(cat, window.active_filters[cat].join(','));
        }
      }
    });
    fetch(url.href, {
      method: "GET",
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(r => r.text())
    .then(html => {
      Turbo.renderStreamMessage(html)
      if (event !== null ) {
        event.target.parentNode.classList.remove('active')
      }
    })*/
  }
}
