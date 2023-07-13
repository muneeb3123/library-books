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

class CapitalizeDecorator < BaseDecorator
  def correct_name
    capitalized_words = @object.correct_name.chars.map(&:capitalize)
    capitalized_words.join
  end
end


class TrimmerDecorator < BaseDecorator
  def correct_name
    @object.correct_name[0, 10]
  end
end

