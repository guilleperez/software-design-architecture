# Adapter Pattern
# Date: 23-Sep-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva

# File: simple_queue.rb

# IMPORTANT: Do not modify the following class in any way!

class SimpleQueue
  
  # Initializes a new stack of SimpleQueue
  def initialize
    @info =[]
  end

  # Inserts x at the back of this queue. Returns this queue.
  def insert(x)
    @info.push(x)
    self
  end
  
  # Removes and returns the element at the front of this queue. 
  # Raises an exception if this queue happens to be empty.
  def remove
    if empty?
      raise "Can't remove if queue is empty"
    else
      @info.shift
    end
  end

  # Returns true if this queue is empty, otherwise returns false.
  def empty?
    @info.empty?
  end

  # Returns the number of elements currently stored in this queue.
  def size
    @info.size
  end
  
  # Creates a string representation of this SimpleQueue instance.
  def inspect
    @info.inspect
  end

end