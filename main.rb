# rubocop:disable Metrics/CyclomaticComplexity

require_relative 'app'

class Main
  def initialize
    @app = App.new
    @reply = 0
  end

  def run
    while @reply != 7
      puts("
                Please choose an option by entering a number:
                1 - List all books
                2 - List all people
                3 - Create a person
                4 - Create a book
                5 - Create a rental
                6 - List all rentals for a given person id
                7 - Exit
              ")
      start
    end
  end

  def start
    @reply = gets.chomp.to_i
    case @reply
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'That is not a valid option.'
    end
  end
end

main = Main.new
main.run

# rubocop:enable Metrics/CyclomaticComplexity
