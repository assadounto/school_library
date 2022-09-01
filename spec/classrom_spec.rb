require_relative '../classroom'
require_relative '../student'
require_relative '../teacher'
require_relative '../person'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }

  describe '#new' do
    it 'creates a new classroom' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'has a label' do
      expect(classroom.label).to eq('Math')
    end
  end

  describe '#add_student' do
    it 'adds a student' do
      student = classroom.add_student(Student.new(16, 'John', true))
      expect(student.students.size).to eq(1)
    end

    it 'does not add a student if the classroom is full' do
      classroom.add_student(Student.new(34, 'John', true))
      classroom.add_student(Student.new(24, 'Fred', true))
      classroom.add_student(Student.new(34, 'Joe', true))
      classroom.add_student(Student.new(54, 'Jen', true))
      classroom.add_student(Student.new(64, 'Rich', true))
      expect(classroom.students.size).to eq(5)
    end
  end
end
