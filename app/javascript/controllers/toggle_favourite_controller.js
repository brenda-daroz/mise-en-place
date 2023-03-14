import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-favourite"
export default class extends Controller {
static targets = ["items", "icon"]

connect() {
  console.log("I am connected from the ToggleFavourite-Controller")
  console.log(this.element)
  console.log(this.itemsTarget)
  }

toggle(event) {
  event.preventDefault()
  console.log("TODO: send request in AJAX")
  const url = event.currentTarget.href
  this.iconTarget.classList.toggle('fa-regular')
  this.iconTarget.classList.toggle('fa-solid')
  fetch(url)
  }
}
