// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//  <div data-controller="clipboard">
//    PIN: <input data-target="clipboard.source" type="text" value="3737" readonly>
//    <button data-action="clipboard#copy" class="clipboard-button">Copy to Clipboard</button>
//  </div>/
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]

  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}
