# Write a program that, given a natural number and a set of one or more other
# numbers, can find the sum of all the multiples of the numbers in the set that
# are less than the first number. If the set of numbers is not given, use a
# default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20
# that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
# The sum of these multiples is 78.

# rules
# - A SumOfMultiples object is instantiated with any number of integer arguments
# - SumOfMultiples has an instance method to that takes one integer argument
# - SumOfMultiples has a class method to that takes one integer argument
# - The class method to instantiates a SumOfMultiples object passing 3 and 5
#   then calls and returns the instance method to
# - The instance method 2 finds all values that are multiples of integers passed
#   when instantiating the object up to but not including the number pass to two
#   it then sums those numbers and returns the value

# e
# SumOfMultiples.to(10) => 23
# SumOfMultiples.new(7, 13, 17).to(20) => 51

# d
# Array

# a
# #initialize
#   - set @factors to an array of the integers passed

# #to
#   - Iterate over range of 1 to number passed not including the number passed
#     - select based on if any @factors are factors of the current number
#   - sum those values and return that

# ::to
#   - Instantiate a SumOfMultiples object passing 3 and 5
#   - return a call to to on that object

class SumOfMultiples
  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end

  def to(maximum)
    (1...maximum).select do |number|
      @factors.any? { |factor| number % factor == 0 }
    end.sum
  end

  def self.to(maximum)
    SumOfMultiples.new.to maximum
  end
end
