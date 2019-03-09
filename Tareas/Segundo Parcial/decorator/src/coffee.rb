# Decorator Pattern
# Date: 07-Oct-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva
# File: coffee.rb

#Beverages
#Parent class of all the classes
class Beverages
    #Getters and setters fot the description and cost
    attr_accessor :description, :cost
    
    #Initialiazes the beverage objects
    def initialize
        @description = ''
        @cost = 0
    end

end

#Dark Roast Coffee Class. Inherits from Beverages.
class DarkRoast < Beverages
    
    #Updates the description of the Beverage
    def description
        @description << 'Dark Roast Coffee'
    end
    
    #Applies the cost of the Dark Roast Coffee Beverage
    def cost
        @cost += 0.99
    end
end

#Espresso Class. Inherits from Beverages.
class Espresso < Beverages
    
    #Updates the description of the Beverage
    def description
        @description << 'Espresso'
    end
    
    #Applies the cost of the Espresso Beverage   
    def cost
        @cost += 1.99 
    end

end

class HouseBlend < Beverages
    #Updates the description of the Beverage
    def description
        @description << 'House Blend Coffee'
    end
    
    #Applies the cost of House Blend Coffee Beverage   
    def cost
        @cost += 0.89 
    end
end


#Condiments

#Condiment Dedorator. Decorates the Beverage instances with Condiments.
#Inherits from Beverages
class CondimentDecorator < Beverages
    
    #Initializes the CondimentDecorator. Reassigns the beverage to the CondimentDecorator
    def initialize(beverage)
        @beverage = beverage
    end
end

#Mocha Condiment Class. Decorates the Beverage instances. Inherits from Beverages.
class Mocha < CondimentDecorator

    #Updates the description of the Beverage
    def description
        @beverage.description << ", Mocha"
    end

    #Increase the cost of the Beverage
    def cost
        @beverage.cost += 0.20
    end

end

#Whip Condiment Class. Decorates the Beverage instances. Inherits from Beverages.
class Whip < CondimentDecorator
    
    #Updates the description of the Beverage 
    def description
        @beverage.description << ", Whip"
    end

    #Increase the cost of the Beverage
    def cost
        @beverage.cost += 0.10
    end
end

class Soy < CondimentDecorator
    #Updtates the description of the Beverage when adding Soy
    def description
        @beverage.description << ", Soy"
    end

    #Increase the cost of the Beverage when adding Soy
    def cost
        @beverage.cost += 0.15
    end
end

class Milk < CondimentDecorator
    #Updates the description of the Beverage when adding Milk
    def description
        @beverage.description << ", Milk"
    end

    #Increase the cost of the Beverage when adding Milk
    def cost
        @beverage.cost += 0.10
    end
end