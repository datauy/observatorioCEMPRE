import { Controller } from "@hotwired/stimulus"
import "leaflet"

// Connects to data-controller="buyers"
export default class extends Controller {

  static targets = ['buyer']
  static values = { id: Number }

  connect() {}

  expand(e) {
    e.preventDefault()
    
    if ( this.hasBuyerTarget ) {
      let display = 'table-row'
      if ( e.target.getAttribute('aria-expanded') == "true" ) {
        e.target.setAttribute('aria-expanded', false)
        display = 'none'
      }
      else {
        e.target.setAttribute('aria-expanded',true)
      }
      document.querySelectorAll('.child-'+this.idValue).forEach( buyer => {
        console.log(buyer);
        buyer.style.display = display
      })
    }
  }
}
