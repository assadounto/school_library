require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :id, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1..100)
    @parent_permission = parent_permission
    @rentals = []
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
end

person = Person.new(22, 'maximilianus')
p person.correct_name
puts person.of_age?
p person.can_use_services?
capitalizedperson = CapitalizeDecorator.new(person)
p capitalizedperson.correct_name
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedperson)
p capitalizedtrimmedperson.correct_name
