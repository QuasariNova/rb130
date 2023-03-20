class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    todos.each { |todo| yield todo }
    self
  end

  def select
    results = TodoList.new title
    each { |todo| results << todo if yield todo }
    results
  end

  def find_by_title(todo_title)
    each { |todo| return todo if todo.title == todo_title }
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    todo = find_by_title title
    todo.done! unless todo.nil?
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    todos << todo
    self
  end

  alias << add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(index)
    todos.fetch index
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each { |todo| todo.done! }
    self
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete item_at(index)
  end

  def to_s
    string_arr = ["---- #{title} ----"]
    todos.each do |todo|
      string_arr << todo.to_s
    end
    string_arr.join "\n"
  end

  private

  attr_reader :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

result = list.mark_done "Clean room"

puts result.inspect
