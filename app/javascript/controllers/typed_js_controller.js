import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["The first smurf platform !", "Find the smurf house of your dreams !"],
      typeSpeed: 60,
      loop: true
    })
  }
}
