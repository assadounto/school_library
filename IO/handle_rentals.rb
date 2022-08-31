require "json"
require_relative "../rental"

module HandleRentals

  def store_rental
    rentals_arr = []
    @rentals.each do |rental|
      rentals_arr << {
        date: rental.date,
        book_title: rental.book.title,
        personId: rental.person.id
      }
    end
    write_json(rentals_arr, "rentals.json")
  end

  def load_rentals
    file = File.read("rentals.json")
    JSON
      .parse(file)
      .each do |rental|
        date = rental['date']
        person = filter_people(rental['personId'])
        book = filter_books(rental['book_title'])
        @rentals.push(Rental.new(date, book, person))
      end
  end

  def filter_people(personId)
     @people.filter do |person|
        person if person.id == personId
     end
  end

  def filter_books(title)
    @books.each do |book|
      book if book.title == title
    end
  end
end
