require "json"
require_relative "book"
require_relative "person"
require_relative "rental"

module HandlerFile
  def people_to_json
    person_data = []
    # teacher{
        teacher:person
    }
    @people.each { |person| if person_data << person}
    File.open("people.json", "a") do |person|
      puts person.write(JSON.generate(person_data))
    end
  end



  def rentals_to_json
  end
end

 def load_books
   puts file = File.read("test.txt")

  end

  load_books()
