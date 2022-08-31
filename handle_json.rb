require "json"
require_relative "book"
require_relative "person"
require_relative "rental"

module HandlerFile
  def store_people
    json = []
    @people.map do |person|
      if person.instance_of?(Student)
        json.push(
          {
            type: "student",
            id: person.id,
            age: person.age,
            name: person.name,
            parent_permission: person.parent_permission
          }
        )
      else
        json.push(
          {
            specialization: person.specialization,
            type: "teacher",
            id: person.id,
            age: person.age,
            name: person.name
          }
        )
      end
    end
    write_json(json, "people.json")
  end

  def load_people
    file = File.read("people.json")
    mydata = JSON.parse(file)
    mydata.each do |person|
      if person["type"] == "teacher"
        @people.push(
          Teacher.new(person["specialization"], person["age"], person["name"])
        )
      else
        @people.push(
          Student.new(
            person["age"],
            person["name"],
            person["parent_permission"]
          )
        )
      if person['type']=='teacher'
        teacher=Teacher.new(person['age'],person['name'],person['specialization'])
        teacher.id=person['id']
        @people.push(teacher)
      else
        student=Student.new(person['age'],person['name'],person['parent_permission'])
        student.id=person['id']
        @people.push(student)
      end
    end
  end

  def store_book
    books_arr = []
    @books.each do |book|
      books_arr << { title: book.title, author: book.author }
    end
    write_json(books_arr, "books.json")
  end

  def load_books
    file = File.read("books.json")
    JSON
      .parse(file)
      .each { |book| @books.push(Book.new(book["title"], book["author"])) }
  end

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

  def write_json(array, filename)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: "  ",
      space_before: " ",
      space: " "
    }
    File.open(filename, "w") { |f| f.write(JSON.generate(array, opts)) }
  end
end
