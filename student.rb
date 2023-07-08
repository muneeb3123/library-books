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

# classroom = Classroom.new('Physics')
# classroom1 = Classroom.new('Chemistry')
# classroom2 = Classroom.new('Biology')
# student = Student.new('Amir', 28)
# student1 = Student.new('Muneeb', 21)
# student2 = Student.new('Talha', 22)

# student.add_classroom(classroom)
# student1.add_classroom(classroom1)
# student2.add_classroom(classroom2)

# puts "#{student.name} : #{student.classroom.label}"
# puts "#{student1.name} : #{student1.classroom.label}"

# puts "#{student2.name} : #{student2.classroom.label}"
# print "Students in #{classroom.label}: "
# classroom.students.each do |student_in_classroom|
#   puts student_in_classroom.name
# end

# print "Students in #{classroom1.label}: "
# classroom1.students.each do |student_in_classroom1|
#   puts student_in_classroom1.name
# end

# print "Students in #{classroom2.label}: "
# classroom2.students.each do |student_in_classroom2|
#   puts student_in_classroom2.name
# end
