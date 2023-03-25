# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type,
# like a set. In this exercise you will define your own set type. How it works
# internally doesn't matter, as long as it behaves like a set of unique
# elements that can be manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript, there is a built-in Set
# type. For this problem, you're expected to implement your own custom set
# type. Once you've reached a solution, feel free to play around with using the
# built-in implementation of Set.

# For simplicity, you may assume that all elements of a set must be numbers.

# rules
# - CustomSet class
# - #initialize takes one argument
#   - parameter is an array set to an empty array by default
#   - array will have uniq ran on it before being stored in an instance variable
# - #empty?
#   - returns if set is empty
# - #contains? takes one argument
#   - checks if CustomSet contains argument
# - #subset? takes one argument
#   - argument is another object of CustomSet type
#   - Checks if every element in set is part of arguments set
# - #disjoint? takes one argument
#   - argument is another object of CustomSet type
#   - Checks if no element in set is part of arguments set
# - #eql? takes one argument
#   - argument is another set
#   - Checks if all elements are the same between two sets
#   - order doesn't matter
# - #add takes one argument
#   - argument is added to internal array
#   - values have to be unique
#   - returns self
# - #intersection takes one argument
#   - argument is another set
#   - returns new set that is all the same elements between the two sets
# - #difference takes one argument
#   - argument is another set
#   - returns new set that is all the elements that are different between two
#     sets.
# - #union takes one argument
#   - argument is another set
#   - returns new set that is a combination of both sets

class CustomSet
  def initialize(arr=[])
    @list = arr.uniq
  end

  def empty?
    list.empty?
  end

  def contains?(element)
    list.include? element
  end

  def subset?(other)
    list.all? { |ele| other.contains? ele }
  end

  def disjoint?(other)
    list.none? { |ele| other.contains? ele }
  end

  def eql?(other)
    list.sort == other.list.sort
  end

  alias == eql?

  def add(ele)
    @list << ele unless contains? ele
    self
  end

  def intersection(other)
    new_list = list.select { |ele| other.contains? ele }
    self.class.new new_list
  end

  def difference(other)
    new_list = list - other.list
    self.class.new new_list
  end

  def union(other)
    new_list = list + other.list
    self.class.new new_list
  end

  protected

  attr_reader :list
end
