# Write a program that will take a string of digits and return all the possible
# consecutive number series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:

#     012
#     123
#     234

# Likewise, here are the 4-digit series:

#     0123
#     1234

# Finally, if you ask for a 6-digit series from a 5-digit string, you should
# throw an error.

# rules
# - Series object is instatiated with a string of digits
# - Series has an instance method named slices that takes an integer as an
#   argument
# - slices returns an array of subarrays each with integers inside them
#   - these subarrays are the series of digits in the string of length passed
#     to slices
# - slices raises an Argument error if the number passed is greater than the
#   length of the string given to the Series object

# e
# "01234", 3 = [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

# d
# Array

# a
# #initialize
#   - Given a string, convert it to an array of numbers and set @digits to it

# #slice
#   - Given a integer length
#   - raise Argument error if length greater than size of @digits
#   - Set results to empty array
#   - Iterate over each series of length @digits
#     - add series to results
#   - return results

class Series
  def initialize(string_of_digits)
    @digits = string_of_digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError unless length <= @digits.size

    @digits.each_cons(length).to_a
  end
end
