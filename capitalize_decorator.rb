require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    capitalized_words = @object.correct_name.chars.map(&:capitalize)
    capitalized_words.join
  end
end
