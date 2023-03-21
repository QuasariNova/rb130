# In this exercise, your task is to create a new Enumerator object. When
# creating a new Enumerator, you may define what values are iterated upon.
# We'll want to create an Enumerator that can iterate over an infinite list of
# factorials. Once you make this new Enumerator, test it out by printing out
# the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External
# Iterator". Once you have done so, see what happens if you print 3 more
# factorials (the results won't be correct). Now, reset your Enumerator (use
# the rewind method). Finally, print 7 more factorials.

enumerator = Enumerator.new do |factorials|
  factor = 0
  current = 1

  loop do
    current *= factor unless factor < 2
    factorials << current

    factor += 1
  end
end

7.times { |number| puts enumerator.next }
puts nil
3.times { |number| puts enumerator.next }
puts nil

enumerator.rewind
7.times { |number| puts enumerator.next }
