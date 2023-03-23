# Write a program to determine whether a triangle is equilateral, isosceles, or
# scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0,
# and the sum of the lengths of any two sides must be greater than the length
# of the third side.

# Rules
# - Triangle object constructed of 3 sides
# - Triangle has instance method kind that returns what kind of triangle it is
# - Equilateral triangle has all three sides the same length
# - Isosceles triangle has two sides the same length
# - Scalene Triangle has no sides the same length
# - Valid Triangles have all sides > 0 length and 2 sides added together are
#   always greater than the third.
# - Output of kind method is a string
# - Invalid triangles raise an ArgumentError

# e
# triangle = Triangle.new 2, 2, 2
# p triangle.kind == 'equilateral'

# triangle = Triangle.new 4, 4, 3
# p triangle.kind == 'isosceles'

# triangle = Triangle.new 3, 4, 5
# p triangle.kind == 'scalene'

# triangle = Triangle.new 10, 1, 3 # Raises ArgumentError

# triangle = Triangle.new 0, 1, 2 # Raises ArgumentError

# d
# Array

# a
# #initialize
#   - Given sides a b c as numerics
#   - Check if valid, raise ArgumentError if not
#     - Check if all sides are not zero or less
#     - Check that the two smaller sides summed are greater than the largest
#       sized side
#   - Create instance variable @sides and assign to array of a,b,c

# #kind
#   - Given array of sides @sides
#   - Check if all sides are equal, if so return 'equilateral'
#   - Check if two sides are equal, if so return 'isosceles'
#   - return 'scalene'

class Triangle
  attr_reader :sides

  def initialize(a, b, c)
    raise ArgumentError unless valid_triangle? a, b, c
    @sides = [a, b, c]
  end

  def kind
    uniq_sides = @sides.map(&:to_f).uniq
    return 'equilateral' if uniq_sides.size == 1
    return 'isosceles' if uniq_sides.size == 2
    'scalene'
  end

  private

  def valid_triangle?(*lengths)
    return false if lengths.any? { |side| side <= 0 }

    longest = lengths.max
    lengths.delete_at lengths.index(longest) # I want to delete 1 side, not two
    lengths.sum > longest
  end
end
