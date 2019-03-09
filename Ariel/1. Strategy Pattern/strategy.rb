class Student

  attr_reader :id, :name, :gender, :gpa

  def initialize(id, name, gender, gpa)
    @id = id
    @name = name
    @gender = gender
    @gpa = gpa
  end

end

class StudentStrategy

  def execute(array)
    raise 'Abstract method called!'
  end

end

class Course

  def strategy=(new_strategy)
    if !new_strategy.is_a? StudentStrategy
      raise 'Invalid argument. Was expecting a StudentStrategy.'
    end
    @strategy = new_strategy
  end

  def initialize
    @students = []
    @strategy = nil
  end

  def add_student(student)
    @students.push(student)
  end

  def execute
    @strategy.execute(@students)
  end

end

class CountGenderStrategy < StudentStrategy
  
  def initialize(gender)
    @gender = gender
  end
  
  def execute(array)
    array.count {|s| s.gender = @gender}
    # count = 0
    # array.each do |student|
    #   if student.gender == @gender
    #     count += 1;
    #   end
    # end
    # count
  end

end


class ComputeAverageGPAStrategy < StudentStrategy
  
  def execute(array)
    return nil if array.empty?
    (array.sum {|s| s.gpa}) / array.size
    
    # sum = 0
    # array.each do |student|
    #   sum += student.gpa;
    # end
    
    # if array.size == 0
    #   avg = nil
    # else
    #   avg = sum / array.size
    # end
    
    # avg
  end
  
end

class BestGPAStrategy < StudentStrategy
  
  def execute(array)
    return nil if array.empty?
    (array.max {|a, b| a.gpa <=> b.gpa}).name
    
    # best = 0
    # studentName = nil
    # array.each do |student|
    #   if student.gpa > best
    #     best = student.gpa
    #     studentName = student.name
    #   end
    # end
  
    # studentName
  end

end
