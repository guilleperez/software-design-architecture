class Player
    def initialize(name)
        @name = name
    end
    
    def rey_bellako
    end
    
    def to_s
        "Soy #{@name}, Hijo de Tlaloc, Rey del Sur de la Cedemex, Heredero al trono de México"
    end
end

p = Player.new('Luca-tero')
array = ["hello", 1, p]
array.each {|x| puts x.to_s}
puts(p)