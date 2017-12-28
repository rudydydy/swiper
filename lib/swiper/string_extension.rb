class String
  def camelize
    self.split('_').collect(&:capitalize).join
  end

  def to_variable_name
    splitted_string = self.split('_')
    head = splitted_string[0]
    tail = (splitted_string - [head]).collect(&:capitalize).join

    "#{head}#{tail}"
  end
end
