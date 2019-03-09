# Template Method Pattern
# Date: 19-Aug-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva

# File name: student.rb

# This class contains the methods used by the student class
class Student

  include Enumerable
  # Note: This class does not support the max, min, 
  # or sort methods.

  #Creates a new instance of a Student
  def initialize(id, name, grades)
    @id = id
    @name = name
    @grades = grades
  end
  
  #Inspects an instance of a Student. Displays its
  #id and name
  def inspect
    "Student(#{@id}, #{@name.inspect})"
  end
  
  #Gets the avergares of the grades of a Student
  def grade_average
    @grades.inject(:+)/@grades.size
  end
  
  #Yields the id, name, and grades. Calss the +grade_average+
  #method sending the averages of a Student
  def each &block
    yield @id
    yield @name
    @grades.each(&block)
    yield grade_average
  end

end