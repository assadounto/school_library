require 'json'
require_relative '../rental'

module HandleRentals
  def store_rental
    rentals_arr = []
    @rentals.each do |rental|
      rentals_arr << {
        date: rental.date,
        book_title: rental.book.title,
        person_id: rental.person.id
      }
    end
    write_json(rentals_arr, 'rentals.json')
  end

  def load_rentals
    file = File.read('rentals.json')
    JSON
      .parse(file)
      .each do |rental|
        date = rental['date']
        person = filter_people(rental['person_id'])
        book = filter_books(rental['book_title'])
        @rentals.push(Rental.new(date, book, person))
      end
  end

  def filter_people(person_id)
    @people.filter { |person| return person if person.id == person_id }
  end

  def filter_books(title)
    @books.each { |book| return book if book.title == title }
  end
end
