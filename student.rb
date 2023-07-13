require_relative 'classroom'
require_relative 'person'

class Student < Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :classroom

  def initialize(name = 'unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @name = name
    @age = age
  end

  def play_hookey
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
