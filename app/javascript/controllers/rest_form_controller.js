import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rest-form"
export default class extends Controller {
  reset() {
    this.element.reset()
  }
}
