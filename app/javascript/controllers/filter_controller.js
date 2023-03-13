import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {


  static targets = ["collapser", "button"]


  connect() {
    console.log("Hello motto")
  }

  expander(event) {
    console.log(event)
    this.collapserTarget.classList.toggle("show")
    if (this.buttonTarget.innerText === "+") {
      this.buttonTarget.innerText = "-"
    } else {
      this.buttonTarget.innerText = "+"
    }
  }
}
