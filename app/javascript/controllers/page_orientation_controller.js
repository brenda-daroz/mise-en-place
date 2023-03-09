import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page-orientation"
export default class extends Controller {
  static targets = ["body"]
  connect() {
    console.log(this.bodyTarget)
  }

  changeOrientation() {
    console.log("hello from stimulus orientation")

    const body = this.bodyTarget;
    body.requestFullscreen()
    screen.orientation.lock("landscape")
  }
}
