require_relative 'base_decorator'

class Capitalize_Decorator < Base_decorator
  def correct_name
    capitalized_words = @nameable.correct_name.split('').map(&:capitalize)
    capitalized_words.join('')
  end
end

  