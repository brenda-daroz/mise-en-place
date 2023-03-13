import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["ingredientsList"]
  static values = {
    recipeId: String
  }
  // static classes = ["active"]

  connect() {
    // console.log(this.changeTarget)
  }

  changeUnits(e) {
    fetch(e.target.dataset.route)
      .then((response) => response.text())
      .then(data => {
        this.ingredientsListTarget.innerHTML = data
      })
  }

  changePortion(e) {
    fetch(e.target.dataset.route)
      .then((response) => response.text())
      .then(data => {
        this.ingredientsListTarget.innerHTML = data
      })
  }
}
