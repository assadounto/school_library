require_relative 'app'
require_relative 'start'
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
end

main = Main.new
main.run
