require_relative 'base_decorator'

class Trimmer_Decorator < Base_decorator
    def correct_name
        @nameable.correct_name[0, 10]
    end
end