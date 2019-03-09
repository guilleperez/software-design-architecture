# Answer the following questions:
#
#  1. What is the Prototype Pattern?
#   It is design pattern that lets you produce new objects by copying existing ones without compromising their internals.
#   It hides the coplexity of making new instances from the client. 
#
#  2. How can we apply this pattern to the class Person?
#
class Person
    
    attr_accessor :name, :favorite_things
    
    def clone()
        clone = super
        clone.name = @name.clone
        clone.favorite_things = @favorite_things.clone
        clone
    end
    # def clone()
    #   clone = Person.new(@name)
    #   @favorite_things.each do |t|
    #     clone << t
    #   end
    #   clone
    # end
  
  def initialize(name)
    @name = name
    @favorite_things = []
  end
  def <<(thing)
    @favorite_things << thing
  end
  def each(&block)
    @favorite_things.each(&block)
  end
end

class HappyPerson < Person
    def say_hi
        puts "Hi"
    end
end

maria = Person.new('Fräulein Maria')
maria << 'Raindrops on roses'
maria << 'Whiskers on kittens'
maria << 'Bright copper kettles'
maria << 'Warm woolen mittens'
maria << 'Brown paper packages tied up with strings'
maria.each {|x| p x} 

maria_clone = maria.clone
maria_clone << 'Rock music'
p maria_clone.to_enum.to_a
p maria.to_enum.to_a

happy_person = HappyPerson.new('Bob')
happy_person.say_hi
happy_person_clone = happy_person.clone
happy_person_clone.say_hi
