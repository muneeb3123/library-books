require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(object)
    @object = object
    super()
  end

  def correct_name
    @object.correct_name
  end
end
