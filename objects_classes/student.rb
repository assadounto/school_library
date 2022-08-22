require_relative './person.rb'

class Student < Person
    def initialize(classroom, age, name)
        super(age,name)
        @classroom = classroom
    end
      def play_hooky
        "¯\(ツ)/¯"
    end
end
 
p student = Student.new('55',2,"rich")
p student.play_hooky()
p student.can_use_services?()