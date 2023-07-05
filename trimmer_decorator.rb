require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @object.correct_name[0, 10]
  end
end
