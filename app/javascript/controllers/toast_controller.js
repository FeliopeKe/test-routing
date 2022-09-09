
import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"

export default class extends Controller {
  static targets = [ "output" ]

  initialize() {
  }

  connect() {
    let toastElList = [].slice.call(document.querySelectorAll('.toast'))
    let option = {}
    let toastList = toastElList.map(function (toastEl) {
      let toast = new Toast(toastEl, option)
      toast.show()
    })
  }
}
