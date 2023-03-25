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
#   - ::from_a takes one argument
#     - converts an array to SimpleLinkedList
#     - if argument is nil, treat as empty array
#   - #size
#     - returns size of list
#   - #empty?
#     - returns if head is nil
#   - #push takes 1 argument
#     - adds value to list as new Element
#     - newest element is linked to the last element added
#   - #pop
#     - returns datum of last element and sets head to next
#   - #head
#     - returns last Element added
#   - #peek
#     - returns datum from head
#   - #to_a
#     - Converts SimpleLinkedList to array
#   - #reverse
#     - Reverses SimpleLinkedList maybe returning a new object

# d
# Array

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(arr)
    arr = [] if arr.nil?

    list = self.new
    arr.reverse_each { |ele| list.push ele }

    list
  end

  def initialize
    @head = nil
  end

  def size
    count = 0
    each { count += 1}
    count
  end

  def empty?
    head.nil?
  end

  def push(datum)
    self.head = Element.new(datum, head)
    self
  end

  def pop
    return nil if empty?

    value = head.datum
    self.head = head.next

    value
  end

  def peek
    head.datum unless empty?
  end

  def to_a
    each.with_object([]) { |ele, obj| obj << ele.datum }
  end

  def reverse
    self.class.from_a to_a.reverse
  end

  private

  attr_writer :head

  def each
    enum = Enumerator.new do |arr|
      current = head

      until current.nil?
        arr << current
        current = current.next
      end
    end

    if block_given?
      enum.each { |ele| yield ele }
    else
      enum
    end
  end
end
