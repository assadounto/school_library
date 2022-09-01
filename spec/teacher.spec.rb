require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 30, 'John') }

  describe '#new' do
    it 'creates a new teacher' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'has a specialization' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'has an age' do
      expect(teacher.age).to eq(30)
    end

    it 'has a name' do
      expect(teacher.name).to eq('John')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
