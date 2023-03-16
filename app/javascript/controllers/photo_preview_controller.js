import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["input", "image"]

  displayPreview() {
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        this.imageTarget.src = event.currentTarget.result;
      }
      reader.readAsDataURL(this.inputTarget.files[0])
      this.imageTarget.classList.remove('hidden');
    }
  }
}
