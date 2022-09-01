require_relative '../person'

describe Person do
  let(:person) { Person.new(18, 'rich') }

  describe '#new' do
    it 'creates a new person' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'has a name' do
      expect(person.name).to eq('rich')
    end

    it 'has an age' do
      expect(person.age).to eq(18)
    end
  end

  describe '#can_use_services?' do
    it 'returns false' do
      expect(person.can_use_services?).to be(true)
    end
  end
end
