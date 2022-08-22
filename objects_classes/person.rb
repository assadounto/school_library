class Person 
     attr_accessor :name, :age, :id, :parent_permission
    def initialize(age,name="Unknown",parent_permission=true)
        @name = name
        @age = age
        @id = Random.rand(1..100)
        @parent_permission = parent_permission
    end
    def is_of_age?
       if @age >= 18
              result = true
       else
              result = false
       end
    end
    def can_use_services?
        if @parent_permission == true || is_of_age? == true
            result = true
        else
            result = false
        end
    end
end

    person=Person.new(2,"rich")
    puts person.is_of_age?()
    p person.can_use_services?()