require_relative 'person'
require_relative 'book'
class Rental
  attr_accessor :date
  attr_reader :book, :person, :rentals

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
