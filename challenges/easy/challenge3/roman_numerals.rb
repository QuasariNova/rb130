# Write some code that converts modern decimal numbers into their Roman number
# equivalents.

# The Romans were a clever bunch. They conquered most of Europe and ruled it
# for hundreds of years. They invented concrete and straight roads and even
# bikinis. One thing they never discovered though was the number zero. This
# made writing and dating extensive histories of their exploits slightly more
# challenging, but the system of numbers they came up with is still in use
# today. For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that
# these letters have lots of straight lines and are hence easy to hack into
# stone tablets.

#  1  => I
# 10  => X
#  7  => VII


# There is no need to be able to convert numbers larger than about 3000. (The
# Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each
# digit separately starting with the left most digit and skipping any digit
# with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals,
# 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

# Rules
# - RomanNumeral object is instantiated using an integer value
# - RomanNumeral has an instance method to_roman
# - to_roman converts the integer value to roman numerals
# - I is numeral for 1, II for 2, etc
# - V is numeral for 5
# - X == 10
# - L == 50
# - C == 100
# - D == 500
# - M == 1000
# - You can decrement each by 1/10/100 by prepending I/X/C. Though only once
# = Roman numerals are done with the most significant digit on the left, and
#   skipping 0s

# e
# 1990 is MCMXC
# 2008 is written as MMVIII

# d
# Integer=>string
# Hash

# a
# #initialize
#   - given an integer, store that integer in @number

# #to_roman
#   - convert @number to string and set digits to it
#   - Create an empty string called result
#   - iterate over each character, maintaining what digit it is looking at.
#     - If digit is 0, skip
#     - otherise convert character to roman digit and append to result
#       - if digit is contained in DIGITs, return that value
#       - if digit+1 is contained in DIGITs, return those two values
#       = if digit > 5, return 5 digit + 1s for each remaining point
#       - return 1s
#   - return result

class RomanNumeral
  DIGITS = {1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D',
            1000 => 'M'}

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = @number.to_s.chars
    total_digits = digits.size

    result = ''
    digits.each_with_index do |digit, index|
      next if digit.to_i.zero?
      result << to_digit(digit.to_i, total_digits - index - 1)
    end

    result
  end

  private

  def to_digit(digit, place)
    power = 10.pow place
    value = digit * power
    return DIGITS[value] if DIGITS.include? value # pure

    value += 1 * power # 4 / 9
    return DIGITS[1 * power] + DIGITS[value] if DIGITS.include? value

    result = ''
    if digit >= 5 # 5+
      result << DIGITS[5 * power]
      digit -= 5
    end

    digit.times { result << DIGITS[power] } # 1s
    result
  end
end
