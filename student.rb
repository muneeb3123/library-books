require_relative 'person'

class Student < Person
  def initialize(classroom, name = 'unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hookey
    '¯(ツ)/¯'
  end
end

m1 = Student.new('doctor')
m1.play_hookey
