# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.

# p
# Given a value, find all it's divisors

# rules
# input: integer
# output: Array
# - order doesn't matter
# - a divisor has a modulo of 0

# a
# - Given an integer value
# - Create an empty array results
# - Iterate over integers from 1 to value / 2
#   - If value % current_iterator == 0, add to array
# - add value to array

def divisors(value)
  results = (1..(value / 2)).select { |div| value % div == 0 }
  results << value
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
