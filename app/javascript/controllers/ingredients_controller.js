import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ingredients"
export default class extends Controller {
  static targets = ["ingredientsList"]
  static values = {
    recipeId: String
  }

  connect() {
    console.log("Hello from stimulus")
  }

  changeUnits(e) {
    fetch(e.target.dataset.route)
      .then((response) => response.text())
      .then(data => {
        console.log(data)
        this.ingredientsListTarget.innerHTML = data
      })
  }
}
