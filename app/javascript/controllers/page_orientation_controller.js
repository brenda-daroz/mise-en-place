import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page-orientation"
export default class extends Controller {
  static targets = ["fullscreen"]
  connect() {
    this.fullscreenTarget.addEventListener("fullscreenchange", () => {
      if (document.fullscreenElement) {
        this.fullscreenTarget.classList.remove('cooking-mode-hidden')
      } else
        this.fullscreenTarget.classList.add('cooking-mode-hidden')
    })
  }

  changeOrientation() {
    console.log("hello from stimulus orientation")

    this.fullscreenTarget.requestFullscreen()
    screen.orientation.lock("landscape")
  }
}
