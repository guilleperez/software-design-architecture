# Adapter Pattern
# Date: 23-Sep-2018
# Authors:
#          A01377162 Guillermo Pérez Trueba 
#          A01020507 Luis Ángel Lucatero Villanueva

# File: queue_adapter.rb

#A class that adapts a FIFO queue to LIFO queue.
class QueueAdapter
    
    # Initializes a new stack, using q as the adaptee.
    def initialize(q) 
        @queue = q
    end
    
    # Push method inserts x at the top of this stack. 
    # Returns this stack.
    def push(x) 
        @queue.insert(x)
        self
    end
    
    # Returns nil if this stack is empty, otherwise removes 
    # and returns its top element.
    def pop
        if @queue.empty?
            nil
        else
            tempArr = []
            while @queue.size > 1
                tempArr.push(@queue.remove)
            end
            tempItem = @queue.remove
            while !tempArr.empty?
                @queue.insert(tempArr.pop)
            end
            tempItem
        end
    end
    
    # Returns nil if this stack is empty, otherwise 
    # returns its top element without removing it.
    def peek
        if empty?
            nil
        else
            tempArr = []
            while @queue.size > 1
                tempArr.push(@queue.remove)
            end
            tempItem = @queue.remove
            while !tempArr.empty?
                @queue.insert(tempArr.pop)
            end
            @queue.insert(tempItem)
            tempItem
        end
    end
    
    # Returns true if this stack is empty, otherwise 
    # returns false.
    def empty?
        @queue.empty?
    end
    
    # Returns the number of elements currently stored in 
    # this stack.
    def size
        @queue.size
    end
end