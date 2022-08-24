require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @id = Random.rand(1..100)
    @parent_permission = parent_permission
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
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
