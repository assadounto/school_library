require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  let(:rental) { Rental.new('2020-01-01', Book.new('Title', 'Author'), Person.new('Name', 18)) }

  describe '#new' do
    it 'creates a new rental' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'has a date' do
      expect(rental.date).to eq('2020-01-01')
    end

    it 'has a book' do
      expect(rental.book).to be_an_instance_of(Book)
    end

    it 'has a person' do
      expect(rental.person).to be_an_instance_of(Person)
    end
  end
end
