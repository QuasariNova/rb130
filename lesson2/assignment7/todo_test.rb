require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new "Buy milk"
    @todo2 = Todo.new "Clean room"
    @todo3 = Todo.new "Go to gym"
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new "Today's Todos"
    @list.add @todo1
    @list.add @todo2
    @list.add @todo3
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal @todos, @list.to_a
  end

  # 2. size
  def test_size
    assert_equal 3, @list.size
  end

  # 3. Create test for #first. Launch School uses assert_equal
  def test_first
    assert_same @todo1, @list.first
  end

  # 4. Create test for #last. Launch School uses assert_equal
  def test_last
    assert_same @todo3, @list.last
  end

  # 5. Create test for #shift.
  # Hint: TodoList#shift should remove and return the first item in the list.
  # You probably want an assertion for each of those behaviors.
  def test_shift
    assert_same @todo1, @list.shift
    assert_equal [@todo2, @todo3], @list.to_a
  end

  # 6. Create test for #pop.
  # Hint: similar to shift, except pop removes and returns the last item.
  def test_pop
    assert_same @todo3, @list.pop
    assert_equal [@todo1, @todo2], @list.to_a
  end

  # 7. Write a test for done?
  def test_done_question
    assert_equal false, @list.done?
  end

  # 8. Write a test that verifies a TypeError is raised when adding an item
  # into the list that's not a Todo object.
  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('') }
  end

  # 9. Write a test that verifies whether the << method(shovel method) does
  # actually add a Todo to our TodoList.
  def test_shovel
    @list << @todo1
    assert_equal [@todo1, @todo2, @todo3, @todo1], @list.to_a
  end

  # 10. add
  # The add method is aliased to <<. Test that this alias also works as
  # expected.
  def test_add
    todo = Todo.new "Wag the tail"
    @list.add todo
    @todos << todo
    assert_equal @todos, @list.to_a
  end

  # 11. item_at
  # Hint: remember that this method should raise IndexError if we specify an
  # index with no element.
  def test_item_at
    assert_raises(IndexError) { @list.item_at 5 }
    assert_same @todo2, @list.item_at(1)
    assert_same @todo1, @list.item_at(-3)
  end
end
