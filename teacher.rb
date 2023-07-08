require_relative 'person'

class Teacher < Person
  def initialize(specialization, name = 'unknown', age = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
    @name = name
    @age = age
  end

  def can_use_services?
    true
  end
end
