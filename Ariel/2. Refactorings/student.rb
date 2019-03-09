class Student
  
  #Replace Magic Numbers with Symbolic Constant
  GOOD_GRADE = 85
  POOR_INCOME = 15000
  
  attr_reader :name, :id, :anual_income
  
  #Introduce Named Parameter -> add keywords to parameters
  def initialize(name:, id:, anual_income:)
    @name = name
    @id = id
    @anual_income = anual_income
    @grades = []
  end

  def add_grade(grade)
    @grades << grade
    self
  end

  #Rename Method meh -> display_personal_info_and_disclaimer
  def display_personal_info_and_disclaimer
    display_personal_information()
    display_disclaimer()
  end

  def scholarship_worthy?
    # Nothing reasonable to do if this student has currently no grades.
    #Replace Error Code with Exception
    raise 'No available grades' if @grades.empty?

    # A student is worthy of a scholarship if he/she has good grades and
    # is poor.
    #method = variable; -> average = calculate_average()
    #Introduce Explaining Variable -> Set the result of an expresion of function into a variable 
    has_good_grades = average >= GOOD_GRADE
    is_poor = @anual_income < POOR_INCOME
    has_good_grades and is_poor
  end
  
  #Extract Method -> agroup common code into another method if original method is to big
  #Tip: visualize comments
  def display_personal_information()
    # Display Personal Information
    puts "Name: #{ @name } ID: #{ @id }"
    puts "Anual income: #{ @anual_income }"
    average = average()
    puts "Grade average: #{ average }"
  end
  
  #Extract Method -> agroup common code into another method if original method is to big
  #Tip: visualize comments
  def display_disclaimer()
    # Display Disclaimer
    puts 'The contents of this class must not be considered an offer,'
    puts 'proposal, understanding or agreement unless it is confirmed'
    puts 'in a document signed by at least five blood-sucking lawyers.'
  end
  
  #Everything from here on is private
  #Hide Method -> private methods if possible
  private

  #Extract Method -> agroup common code into another method if original method is to big
  def average
    #Split Temporary Variable value -> sum
    #sum = 0
    #Replace Loop with Collection Closure Method
    #@grades.each do |grade|
      #sum += grade
    #end
    #Split Temporary Variable value -> average
    #average = sum / @grades.size.to_f
    
    #Replace Loop with Collection Closure Method
    average = @grades.sum / @grades.size.to_f
    average
  end
  
end