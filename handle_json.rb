require "json"
require_relative "book"
require_relative "person"
require_relative "rental"

module HandlerFile
  def store_people
    json=[]
    @people.map do |person|
      if person.instance_of?(Student)
        json.push({
          type:'student',
          id:person.id,
          age:person.age,
          name:person.name,
          parent_permission:person.parent_permission
        }
      )
        else
          json.push(
            {
              specialization: person.specialization,
              type:'teacher',
              id:person.id,
              age:person.age,
              name:person.name,
            }
          )
          end
    end
       write_json(json, 'people.json')
  end

 def load_people
   file = File.read('people.json')
   mydata=JSON.parse(file)
    mydata.each do |person|
      if person['type']=='teacher'
        @people.push(Teacher.new(person['specialization'],person['age'],person['name']))
      else
        @people.push(Student.new(person['age'],person['name'],person['parent_permission']))
      end
    end
  end

  def write_json(array,filename)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.open(filename, 'w') { |f|
      f.write(JSON.generate(array, opts))}
  end
end
