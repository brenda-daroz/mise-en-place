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

    if (this.fullscreenTarget.requestFullscreen) this.fullscreenTarget.requestFullscreen()
    else if (this.fullscreenTarget.webkitRequestFullscreen) this.fullscreenTarget.webkitRequestFullscreen();
    else if (this.fullscreenTarget.mozRequestFullScreen) this.fullscreenTarget.mozRequestFullScreen(); // Careful to the capital S
    else if (this.fullscreenTarget.msRequestFullscreen) this.fullscreenTarget.msRequestFullscreen();
    else if (this.fullscreenTarget.webkitEnterFullscreen) this.fullscreenTarget.webkitEnterFullscreen();
    screen.orientation.lock("landscape")
  }
}
