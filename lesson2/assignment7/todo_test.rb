require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  # 2. size
  def test_size
    assert_equal(3, @list.size)
  end

  # 3. Create test for #first. Launch School uses assert_equal
  def test_first
    assert_same(@todo1, @list.first)
  end

  # 4. Create test for #last. Launch School uses assert_equal
  def test_last
    assert_same(@todo3, @list.last)
  end

  # 5. Create test for #shift.
  # Hint: TodoList#shift should remove and return the first item in the list.
  # You probably want an assertion for each of those behaviors.
  def test_shift
    assert_same(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
end
