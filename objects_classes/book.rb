class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def add_rental(person)
    Rental.new(@date, self, person)
  end
end
