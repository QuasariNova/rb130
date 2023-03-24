# The diamond exercise takes as its input a letter, and outputs it in a diamond
# shape. Given a letter, it prints a diamond starting with 'A', with the
# supplied letter at the widest point.

#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.

# Examples

# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

# p
# Given a letter, create a diamond shape with that letter at the center

# rules:
# Input: string character
# Output: String
# - Class/Module is Diamond
# - Class/Module method make_diamond
# - Outside of diamond is A-Letter-A. Top and bottom have one alpha character
#   middle have two
# - spaces count across the whole structure
# - Same width as height

# e
# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

# d
# string

# a
# ::make_diamond
# - given string char
# - Figure out width/height
#   - subtract 'A' ord value from char's ord value
#     multiply that by 2 and add 1
# - if width/height is 1, return char
# - set result array to array with first line element
# - iterate over 'B' upto char keeping track of index
#   - add line for current character to result
# - slice from first to last of results not including last and reverse
# - add to results, join, and return

class Diamond
  AVALUE = 'A'.ord

  def self.make_diamond(char)
    width = (char.ord - AVALUE) * 2 + 1
    results = [to_top(width)]

    'B'.upto(char).with_index(1) do |curr_char, idx|
      row_width = 2 * idx + 1
      results << to_row(curr_char, row_width, width)
    end

    results += results[0...-1].reverse
    results.join
  end

  class << self
    private

    def to_top(total_width)
      "#{'A'.center(total_width)}\n"
    end

    def to_row(letter, row_width, total_width)
      row = "#{letter}#{' ' * (row_width - 2)}#{letter}".center(total_width)
      row += "\n"
      row
    end
  end
end
