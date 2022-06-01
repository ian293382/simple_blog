import ApplicationController from './application_controller'


export default class extends ApplicationController {

  sort() {
    let element = document.getElementById('elements')
    let element_items = Array.from(document.getElementsByClassName('element_item'))
    let elements = element_items.map((element, index) => {
      return { id: element.dateset.id, position: index + 1 }
    })

    element.dataset.elements = JSON.string(elements)
    this.stimulate('ElementReflex#sort', element)
  }
}
//
