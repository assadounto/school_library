require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :id, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1..100)
    @parent_permission = parent_permission
    @rentals = []
    @date = Time.now.strftime('%d/%m/%Y')
    super()
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def add_rental(book)
    Rental.new(@date, book, self)
  end
end
