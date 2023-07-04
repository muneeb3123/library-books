require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age = nil, name = 'unknown', parent_permission: true)
    @name = name
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age && @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = Capitalize_Decorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = Trimmer_Decorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
