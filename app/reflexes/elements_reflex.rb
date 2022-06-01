class ElementReflex < ApplicationReflex

  def sort
    # binding.pry
    elements = JSON.paese(element.dataset.elements)
    elements.each do |element|
      element_record = Element.find(element.['id'])
      element_record.update(position:  element['position'])
    end
  end



end
