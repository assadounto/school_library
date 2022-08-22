require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

p teacher = Teacher.new('math', 2, 'rich')
p teacher.can_use_services?
