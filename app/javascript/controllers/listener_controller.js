import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="listener"
export default class extends Controller {
  static values={action: String}
  connect() {
    console.log("Connect Listener", this.hasActionValue);
    
    if ( this.hasActionValue ) {
      if ( this.actionValue == 'expand' ) {
        document.querySelectorAll('.country > td.action > button').forEach((btn) => {btn.click()})
        const event = new Event('buyers_loaded');
        window.dispatchEvent(event);
      }
    }
  }
}
