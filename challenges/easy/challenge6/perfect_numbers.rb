# The Greek mathematician Nicomachus devised a classification scheme for
# natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the
# categories of abundant, perfect, or deficient based on a comparison between
# the number and the sum of its positive divisors (the numbers that can be
# evenly divided into the target number with no remainder, excluding the number
# itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum
# is known as the Aliquot sum.

#     Perfect numbers have an Aliquot sum that is equal to the original number.
#     Abundant numbers have an Aliquot sum that is greater than the original
# number.
#     Deficient numbers have an Aliquot sum that is less than the original
# number.

# Examples:

#     6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 =
# 6.
#     28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 +
# 2 + 4 + 7 + 14 = 28.
#     15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5
# = 9 which is less than 15.
#     24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12
# and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
#     Prime numbers 7, 13, etc. are always deficient since their only divisor
# is 1.

# Write a program that can tell whether a number is perfect, abundant, or
# deficient.

# rules
# - PerfectNumber does not make an object, instead it has a class/module method
#   named classify
# - classify takes an integer
# - non positive numbers raise a StandardError
# - Numbers are 'perfect' if their factors add up to them
# - Numbers are 'deficient' if their factors add up to a number smaller than
#   themselves
# - Numbers are 'abundant' if their factors add up to a number greater than them
# - Factors does not include themselves

# e
# 6 => perfect
# 15 => deficient
# 24 => abundant

# d
# Array

# a
# PerfectNumber::classify
#   - Given an integer number
#   - raise an error if integer is not positive
#   - Find all factors of number save itself
#     - create empty array named factors
#     - iterate over numbers starting at 1 and stopping at sqrt of number
#       - if number is divisible by current number, add both it and its multiple
#         to factors
#     - remove duplicate factors and remove number from factors
#     - return factors
#   - if sum of factors == number, return 'perfect'
#   - if sum of factors < number, return 'deficient'
#   - return 'abundant'

module PerfectNumber
  def self.classify(number)
    raise StandardError unless number.positive?
    sum = find_factors(number).sum
    return 'perfect' if sum == number
    return 'deficient' if sum < number
    'abundant'
  end

  def self.find_factors(number)
    factors = []

    1.upto(Integer.sqrt(number)) do |factor|
      div, mod = number.divmod factor
      factors += [factor, div].uniq if mod.zero?
    end

    factors.delete number
    factors
  end
end
