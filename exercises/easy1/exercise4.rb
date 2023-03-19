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

# def divisors(value)
#   results = (1..(value / 2)).select { |div| value % div == 0 }
#   results << value
# end

# Further Exploration
# How fast can you make your solution go? How big of a number can you quickly
# reduce to its divisors? Can you make divisors(999962000357) return almost
# instantly? (The divisors are [1, 999979, 999983, 999962000357].) Hint: half
# of the divisors gives you the other half.

def divisors(value)
  max = value - 1
  results = [1, value].uniq
  current = 2

  while current < max
    div, mod = value.divmod current
    if mod == 0
      results += [current, div]
      max = div - 1
    end
    current += 1
  end

  results.sort
end

# This solution is slow with very large prime numbers>.< We should instead set
# a limit to the value's square root.

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
