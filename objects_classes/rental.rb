require_relative 'person'
require_relative 'book'
class Rental
    attr_accessor :date
    attr_reader :book, :person , :rentals
    def initialize(date, book, person)
        @date = date
         @rentals = []
         @rentals << self
        @book = book
        book.rentals << self 
       
        @person = person
        person.rentals << self

    end
end
time = Time.new.strftime("%d/%m/%Y")
rich = Person.new(12, 'rich')
kel = Person.new(20, 'rich')
ali = Person.new(22, 'rich')
sam = Person.new(24, 'rich')
book1 = Book.new('lord of the rings', 'jk rowling')
book2 = Book.new('harry potter', 'jk rowling')
book3 = Book.new('tale of two Cities', 'jk rowling')
rental1 = Rental.new(time, book1, rich)
rental2 = Rental.new(time, book2, kel)
rental3 = Rental.new(time, book3, ali)
rental4 = Rental.new(time, book1, sam)
rental5 = Rental.new(time, book2, rich)
puts rich.rentals.map { |rental| rental.book.title }

