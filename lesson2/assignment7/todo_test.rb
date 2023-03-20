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

  # 12. mark_done_at
  # Hint: this method should also raise IndexError if we specify an index with
  # no element.
  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at 100 }
    @list.mark_done_at 1
    assert_equal false, @todo1.done?
    assert_equal true, @todo2.done?
    assert_equal false, @todo3.done?
  end

  # 13. mark_undone_at
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at 20 }
    @todos.each { |todo| todo.done! }

    @list.mark_undone_at 1

    assert_equal true, @todo1.done?
    assert_equal false, @todo2.done?
    assert_equal true, @todo3.done?
  end

  # 14. done!
  # Hint: this method makes all Todos within the list done.
  def test_done_bang
    @list.done!

    assert_equal true, @todo1.done?
    assert_equal true, @todo2.done?
    assert_equal true, @todo3.done?
    assert_equal true, @list.done?
  end

  # 15. remove_at
  # Hint: this method raises IndexError if argument does not return item.
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at 6 }

    deleted = @list.remove_at 1
    assert_equal @todo2, deleted
    assert_equal [@todo1, @todo3], @list.to_a
  end

  # 16. to_s. Copied from Launchschool
  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  # 17. verify that it returns the right multi-line string when one of the
  # todos is done.
  def test_to_s_2
    @todo2.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  # 18. verify that it returns the right multi-line string when all todos are
  # done.
  def test_to_s_3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  # 19. each
  # What we're looking for here is to test that the each method is actually
  # iterating. There are lots of ways to test this, so pick something simple to
  # assert against.
  def test_each
    out = []
    @list.each { |todo| out << todo }
    assert_equal [@todo1, @todo2, @todo3], out
  end

  # 20. Write another test for each, except in this test verify that the each
  # method returns the original object.
  def test_each_2
    out = @list.each {}
    assert_same @list, out
  end

  # 21. select
  # Hint: remember that select returns a new TodoList object.
  def test_select
    selected = @list.select { |todo| todo.title == "Buy milk"}
    refute_same @list, selected
    assert_equal @list.title, selected.title
    assert_equal [@todo1], selected.to_a
  end
end
