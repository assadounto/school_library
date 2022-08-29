require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def take_input_label(label)
    print "#{label}: "
    gets.chomp
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    selection = gets.chomp.to_i
    case selection
    when 1
      student
    when 2
      teacher
    else
      puts 'Invalid option'
    end
  end

  def student
    age = take_input_label('Age')
    name = take_input_label('Name')
    puts 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    else
      puts 'Invalid input'
    end
    @people << Student.new(age, name, parent_permission)
    puts 'Person created successfully'
  end

  def teacher
    age = take_input_label('Age')
    name = take_input_label('Name')
    specialization = take_input_label('specialization')
    @people << Teacher.new(age, name, specialization)
    puts 'Person created successfully'
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_book
    puts 'Please enter the title of the book:'
    title = take_input_label('Title')
    author = take_input_label('Author')
    @books << Book.new(title, author)
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_rentals
    puts 'Enter id:'
    id = gets.chomp.to_i
    @rentals.each do |rental|
      puts 'Rentals'
      rental.person.id && id
      puts "#{rental.date} - #{rental.book.title}"
    end
  end

  def create_rental
    puts 'Please enter the number of the person renting the book not id:'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    person = @people[person_id]
    puts 'Please enter the number of the book being rented:'
    list_books
    book_id = gets.chomp.to_i
    book = @books[book_id]
    puts 'Please enter date'
    date = gets.chomp
    @rentals << Rental.new(date, book, person)
    puts 'rental created sucessfully'
  end
end
