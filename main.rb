class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'unknown', age = nil, parent_permission: true)
    @name = name
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    puts of_age? || @parent_permission
  end

  private

  def of_age?
    @age && @age >= 18
  end
end

class Student < Person
  def initialize(classroom, name = 'unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hookey
    '¯(ツ)/¯'
  end
end

class Teacher < Person
  def initialize(specialization, name = 'unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
