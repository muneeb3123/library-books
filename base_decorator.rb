require_relative 'nameable'

class Base_decorator < Nameable
    def initialize(nameable)
      @nameable = nameable
    end
  
    def correct_name
      @nameable.correct_name
    end
  end
  