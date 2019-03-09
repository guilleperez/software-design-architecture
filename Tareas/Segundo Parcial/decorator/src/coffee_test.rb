# Decorator Pattern
# Date: 07-Oct-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva
# File: coffee_test.rb

require 'minitest/autorun'
require 'coffee'

# The source code contained in this file test the
# implementation of the <em>Decorator Pattern</em>.
class CoffeeTest < Minitest::Test

  #Test the initialization of only one Beverage
  def test_espresso
    beverage = Espresso.new
    assert_equal("Espresso", beverage.description)
    assert_equal(1.99, beverage.cost)
  end


  #Test the initialization of one Beverage and various condiments
  def test_dark_roast
    beverage = DarkRoast.new
    beverage = Milk.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("Dark Roast Coffee, Milk, Mocha, Mocha, Whip", 
                 beverage.description)
    assert_equal(1.59, beverage.cost)
  end

  #Test the initialization of one Beverage and various condiments
  def test_house_blend
    beverage = HouseBlend.new
    beverage = Soy.new(beverage)
    beverage = Mocha.new(beverage)
    beverage = Whip.new(beverage)
    assert_equal("House Blend Coffee, Soy, Mocha, Whip", 
                 beverage.description)
    assert_equal(1.34, beverage.cost)
  end

end