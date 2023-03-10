import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {


  static targets = ["collapser"]


  connect() {
    console.log("Hello motto")
  }

  expander(event) {
    console.log(event)
    this.collapserTarget.classList.toggle("show")
  }
}
