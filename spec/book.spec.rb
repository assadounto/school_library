require_relative '../book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }

  describe '#new' do
    it 'creates a new book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'has a title' do
      expect(book.title).to eq('Title')
    end

    it 'has an author' do
      expect(book.author).to eq('Author')
    end

    it 'has a rentals' do
      expect(book.rentals).to be_an_instance_of(Array)
    end
  end
end
