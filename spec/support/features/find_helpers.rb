module Features
  def find_hidden(element)
    find(element, visible: false)
  end
end