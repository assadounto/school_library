require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end

p student = Student.new('55', 2, 'rich')
p student.play_hooky
p student.can_use_services?
