# Write a simple linked list implementation. The linked list is a fundamental
# data structure in computer science, often used in the implementation of other
# data structures.

# The simplest kind of linked list is a singly linked list. Each element in the
# list contains data and a "next" field pointing to the next element in the
# list of elements. This variant of linked lists is often used to represent
# sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of data
# such as the numbers 1-10. Provide methods to reverse the linked list and
# convert a linked list to and from an array.

# rules
# - Element class
#   - ::new has 2 arguments
#     - First is integer
#     - Second is another Element object, default to nil
#   - #datum
#     - returns value
#   - #tail?
#     - returns whther the element passed during instantiation is nil
#   - #next
#     - returns the element passed during instantiation.

# - SimpleLinkedList class
#   - ::new has 0 arguments
#   - ::from_a
#     - converts an array to SimpleLinkedList
#   - #size
#     - returns size of list
#   - #push takes 1 argument
#     - adds value to list as new Element
#     - newest element is linked to the last element added
#   - #pop
#     - returns datum of last element
#   - #head
#     - returns last Element added
#   - #peek
#     - returns datum from last Element
#   - #to_a
#     - Converts SimpleLinkedList to array
#   - #reverse
#     - Reverses SimpleLinkedList maybe returning a new object

# d
# Array

class Element
  attr_reader :datum

  def initialize(datum, link = nil)
    @datum = datum
    @link = link
  end

  def tail?
    @link.nil?
  end

  def next
    @link
  end
end
