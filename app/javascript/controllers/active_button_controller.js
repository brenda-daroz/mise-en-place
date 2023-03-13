import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="active-button"
export default class extends Controller {
  // static targets = ["change"]
  static classes = ["active"]
  connect() {
    console.log("hello from change button")
    // console.log(this.changeTarget)
  }

  changeClass() {
    // console.log(this.changeTarget)
    this.element.classList.toggle(this.activeClass)
  }
}
