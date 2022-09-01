require_relative '../person'

describe Nameable do
  let(:decorator) { Decorator.new('John') }
  let(:john) { Person.new(23, 'John') }
  describe '#new' do
    it 'creates a new nameable' do
      expect(decorator).to be_an_instance_of(Decorator)
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(john.correct_name).to eq('John')
    end
  end
end
