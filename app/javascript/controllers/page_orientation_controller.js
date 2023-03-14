import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="page-orientation"
export default class extends Controller {
  static targets = ["fullscreen"]
  connect() {

    const x = () => {
      console.log("qualquer coisa")
      if (document.fullscreenElement) {
        this.fullscreenTarget.classList.remove('cooking-mode-hidden')
      } else
        this.fullscreenTarget.classList.add('cooking-mode-hidden')
    }

    this.fullscreenTarget.addEventListener("fullscreenchange", x)

    this.fullscreenTarget.addEventListener("onwebkitfullscreenchange", x)
  }

  changeOrientation() {
    console.log("hello from stimulus orientation")
    let isIOS = /iPad|iPhone|iPod/.test(navigator.platform) ||
      (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1)
    console.log(isIOS)
    if (isIOS) {
      window.location = this.element.dataset.route
    }
    if (this.fullscreenTarget.requestFullscreen) this.fullscreenTarget.requestFullscreen()
    else if (this.fullscreenTarget.webkitRequestFullscreen) this.fullscreenTarget.webkitRequestFullscreen();
    else if (this.fullscreenTarget.mozRequestFullScreen) this.fullscreenTarget.mozRequestFullScreen();
    else if (this.fullscreenTarget.msRequestFullscreen) this.fullscreenTarget.msRequestFullscreen();
    else if (this.fullscreenTarget.webkitEnterFullscreen) this.fullscreenTarget.webkitEnterFullscreen();
    screen.orientation.lock("landscape")
  }
}
