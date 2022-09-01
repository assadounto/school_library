require_relative '../student'

describe Student do
  let(:student) { Student.new(18, 'Rich', true) }

  describe '#new' do
    it 'creates a new student' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'has a name' do
      expect(student.name).to eq('Rich')
    end

    it 'has an age' do
      expect(student.age).to eq(18)
    end

    it 'has a parent permission' do
      expect(student.parent_permission).to be(true)
    end
  end

  describe '#play_hooky' do
    it 'returns a string' do
      expect(student.play_hooky).to be_an_instance_of(String)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(student.can_use_services?).to be(true)
    end
  end
end
