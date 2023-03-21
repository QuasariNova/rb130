For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a `Proc` and a `Lambda`, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

```ruby
# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
```

You can create a proc using the `Kernel#proc` and passing it a block. Outside of this you can create one directly with `Proc::new`. Procs are `Proc` objects and have lenient arity. If you don't pass enough arguments, the parameters that aren't filled are `nil`, while if you pass too many, the overflow are ignored.

```ruby
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
```

Lambdas have a few ways of being defined in Ruby. You can use the `Kernel#lambda` keyword and pass it a block, or you can use `-> (parameters) { #block }`. Lambdas are a special `Proc` object and there is no `Lambda` class. Lambdas have strict arity.

```ruby
# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')
```

To `yield` to a block you need to pass a block to the method that is yielding. Blocks have lenient arity.

```ruby
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
```

Blocks have lenient arity. Blocks are defined either by `{}` or `begin...end`.

---

Overall:
- Blocks and Procs have lenient arity
- Procs are objects that contain blocks
- Lambdas are a special type of Proc and have strict arity
