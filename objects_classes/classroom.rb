require_relative 'student'
require_relative 'teacher'
require_relative 'person'
class Classroom
    attr_accessor :label
    attr_reader :students
    def initialize(label)
        @label = label
        @students = []
    end
    def add_student(student)
        @students << student
        student.classroom = self
    end
end
rich = Student.new('55', 2, 'rich')
 classroom = Classroom.new('55')
   
classroom.add_student(rich)
puts classroom.students.map { |student| student.name }
puts rich.classroom.label

