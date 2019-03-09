class Pow2
    def each
        current = 1
        while current < 100
            yield current
            current *= 2
        end
    end
end

#Never Ends
#Pow2.new.each{|e| puts e}

it = Pow2.new.to_enum
begin
    10.times do
        puts it.next
    rescue StopIteration
        puts 'Stoped'
    end
end


generator = Enumerator.new do |yielder|
    # yielder << 5
    # yielder << 10
    # yielder << 12
    n = 1
    loop do
        yielder << n
        n *= 10
    end
end

puts generator.next
puts generator.next
puts generator.next


p generator.to_a #print generator to_array