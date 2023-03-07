import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["amount", "unit"]

  connect() {
    console.log(this.amountTarget)
    console.log(this.unitTarget)
  }
}
