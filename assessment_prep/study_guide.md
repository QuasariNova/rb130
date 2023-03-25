# Blocks
## Closures, binding, and scope
### Closures ([Closures in Ruby ](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177))

A closure is a way to save a "chunk of code" while binding surrounding context to later execute that "chunk". In Ruby, closures are implemented through `Proc` objects, lambdas, and blocks.

### Binding ([Closures in Ruby](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)) ([Blocks and Variable Scope ](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e))

A closure is able to bind itself to the variables, constants, and methods within scope of its definition. Basically it binds itself to the scope it was in when it was defined.

With variables, it does not keep a reference to the object the variable references, it instead keeps track of the individaul variables. If you were to reassign the variable after the closure is defined, it will be able to reference the new object when invoked.

```ruby
def call(closure)
  closure.call
end

animal = 'cat'
chunk = Proc.new { puts "It's a #{animal}" }

call chunk # => It's a cat

animal = 'dog'
call chunk # => It's a dog
```

In the above code, we use the `call` method to invoke a `Proc` object we create on line 6. This closure binds the `animal` local variable and is allowed to use it. When we pass the `Proc` to `call` on line 21 it outputs `It's a cat`, while after we reassign `animal` to the string `'dog'` on line 23 and do the same method invocation on line 24, we output `'It's a dog'`.

### Scope ([Blocks and Variable Scope ](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e))

Closures create a binding to everything in scope when they are defined. This allows them to use local variables initialized outside of themselves inside their definition. Any local variable initialized inside a closure are not accessible outside of the closure.

## How blocks work, and when we want to use them. ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## Blocks and variable scope ([Blocks and Variable Scope ](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e))

## Write methods that use blocks and procs
### blocks ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

### procs ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## Understand that methods and blocks can return chunks of code (closures) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## Methods with an explicit block parameter ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## Arguments and return values with blocks ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## When can you pass a block to a method ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## &:symbol ([Symbol to proc](https://launchschool.com/lessons/c0400a9c/assignments/26d715d8))

## Arity of blocks and methods ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

# Testing With Minitest
## Testing terminology ([Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5))
### Test Suite

### Test

### Assertion

### DSL

### Code Coverage ([Code coverage](https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c))

## Minitest vs. RSpec ([Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5))

## SEAT approach ([SEAT Approach](https://launchschool.com/lessons/dd2ae827/assignments/5c80633e))

## Assertions ([Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a))

# Core Tools/Packaging Code
## Purpose of core tools
### Rubygems

### RVM and Rbenv

### Bundler

### Rake

## Gemfiles ([Setting Up The Gemfile ](https://launchschool.com/lessons/2fdb1ef0/assignments/61b773fd))
### Gemfile
### Gemfile.lock
### Gemspec ([Preparing a Rubygem](https://launchschool.com/lessons/2fdb1ef0/assignments/918536a2)
