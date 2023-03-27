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

Closures keep track of the local variables that are in scope for them via a binding. This binding consists of the context for a closure. This can include local variables, method calls, constants, and any other artifact.

The bindings are to the variable names in the scope the closure was defined in. Due to this, they are not held back by the references the variables held when the closure was defined, instead they can access whatever is referenced by bound variables when they are invoked.

## How blocks work, and when we want to use them. ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368))

Blocks in Ruby are defined as code between either `{ .. }` or `do...end` which is then passed to a method. We use blocks in methods that defer implementation to the individual programmer.

All methods in Ruby are able to be passed a block implicitly without error. Using the block is up to the individual method.

## Blocks and variable scope ([Blocks and Variable Scope ](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e))

Blocks create a new local scope specific to them. Local variables instantiated inside a block are unable to be accessed outside the block.

## Write methods that use blocks and procs
### blocks ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

Implicit blocks can be called via the `yield` keyword. It works by passing execution to where the closure is defined and execute the code within. Then it will move back to where the execution was before.

`yield` can be passed any number of arguments and will have the return value of the block. You can tell when a block is passed by calling `Kernel#block_given?`. If you use `yield` when no block is passed in, a `LocalJumpError` error will be raised.

You can define a method that takes an explicit block by prepending a parameter with the `&` symbol. This tells Ruby that you want to convert the block passed to the method into a `Proc` that is referenced by said variable.

You can call `Proc` objects by calling the `call` method on the `Proc` object. `#call` can take any number of arguments and returns the same value as the block does.

Closures are used to:
- Defer implementation. You make a general method that defers specific implementation to the method user.
- Sandwich code. It is useful for when you need a general method that does some before and after action that is necessary for multiple implementations. Instead of writing two methods that will be called sandwiching your code, you can instead pass your code as a block to one method that does the setup and teardown code for you.

### procs ([Calling Methods with Blocks](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

`Proc`s are a Ruby object that is a closure. They are able to be assigned to a variable and be passed around. You can invoke the `Proc` object by calling the `call` method on it.

## Understand that methods and blocks can return chunks of code (closures) ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

`Proc`s can be returned.

## Methods with an explicit block parameter ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

Methods that have a parameter that starts with `&` have an explicit block. The explicit block has to be the last parameter of the method definition. The block passed to the method with an explicit block will be converted into a `Proc` object which reference is stored in the variable parameter.

## Arguments and return values with blocks ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

## When can you pass a block to a method ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

You can always implicitly pass a block to every method in Ruby. If the method does not define an explicit block parameter or call `yield`, the method will not use the block. It is best to look at documentation to make sure the method uses a block.

## &:symbol ([Symbol to proc](https://launchschool.com/lessons/c0400a9c/assignments/26d715d8))

Prepending a variable with `&` as an argument tells ruby that you want to convert it to a block.

If the variable is a `Proc`, it will be converted to a block that is passed to the method. If the variable is a symbol instead, it will call `to_proc` first, converting the method with symbol name to `Proc` object, then convert that `Proc` to a block.

For a method to be able to be successfully used as a `Proc`/`Block` it needs to be an instance method of the block argument and it must take 0 arguments itself.

## Arity of blocks and methods ([Writing Methods that take Blocks](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20))

Arity is the rule regarding how many arguments you must pass to something.

`lambda`s and methods have strict arity. This means you must pass the exact number of arguments that it expects.

Blocks and `proc`s have lenient arity, which means Ruby does not care how many arguments are passed to them and does not care how many parameters are defined. If a parameter is not passed a matching argument, the variable will reference `nil`.

# Testing With Minitest

Minitest is a Ruby gem that helps us with unit testing. It is the default testing library that comes with Ruby. Minispec allows us to write tests with plain Ruby code.

Test outputs:
- `.` - test passed
- `F` - test failed
- `S` - test skipped
- `E` - error

## Testing terminology ([Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5))
### Test Suite

The entire set of tests that you use to test your program or application.

### Test

The situation or context in which assertions are checked. A test can contain more than one assertion.

### Assertion

Confirms that the results returned by an interface match what is expected.

### DSL

Domain Specific Language. It is a high level language built for a specific domain. RSpec is a DSL and minitest also has its own DSL you can use.

### Refutations ([Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a))

Refutations are the opposite of Assertions. They confirm that the results returned by an interface aren't something. They are rarely used.

### Code Coverage ([Code coverage](https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c))

Code coverage is how much of your code is covered by the test suite.

100% code coverage is achieved when every single method, including private methods, are tested in the testing suite. You want to make tests that make your public methods call as many of the private methods as you can.

The more fault tolerant your code be, the higher the necessary coverage.

`simplecov` is a tool we can use to calculate code coverage. You just simplye need to install the gem and add this to the top of your test files:

```ruby
require 'simplecov'
SimpleCov.start
```

### Regression ([Introduction](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5))

Regression is where a bug is introduced when code is changed. We use testing to make sure that output continues to be as expected when we make changes.

### Unit Testing

Automated tests that are designed and ran in order to ensure that the smallest possible unit of a program is functioning as intended. In OOP, this "unit" usually consists of a single interface.

## Minitest vs. RSpec ([Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5))

Minitest and RSpec are both testing tools for Ruby. Minitest allows you to write your tests with pure Ruby, while RPSpec only allows use of its DSL.

Minitest has two syntax flavors: assertion and expectation styles. Expectation is more like RSpecs, while assertion is pure Ruby code.

To use minitest add this to your test files:
```ruby
require 'minitest/autorun'
```

For colored test output:
```ruby
require "minitest/reporters"
Minitest::Reporters.use!
```

## SEAT approach ([SEAT Approach](https://launchschool.com/lessons/dd2ae827/assignments/5c80633e))

SEAT stands for:
1. Set up objects for testing
2. Execute code against the test object
3. Assert that executed code performs as expected
4. Tear down and clean up any lingering artifacts

This is a common approach on how to write tests.

With minitest we can define the method `setup` to perform set up and the method `teardown` to perform tear down. The Execute and Assert is usually part of the test methods, defined by prepending a method name with `test_`.

## Assertions ([Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a))

| Assertion | Description |
|---|---|
| assert(test) | Fails unless test is truthy. |
| assert_equal(exp, act) | Fails unless exp == act. |
| assert_nil(obj) | Fails unless obj is nil. |
| assert_raises(*exp) { ... } | Fails unless block raises one of *exp. |
| assert_instance_of(cls, obj) | Fails unless obj is an instance of cls. |
| assert_includes(collection, obj) | Fails unless collection includes obj. |

# Core Tools/Packaging Code
## Purpose of core tools
### Rubygems ([Gems](https://launchschool.com/books/core_ruby_tools/read/gems))

RubyGems are code packages you can download, install, and use in your programs or run from the command line. The command line tool `gem` is used to manage your Gems.

Some useful gems include:
- `rubocop`: Checks for style guide violations in code
- `pry`: Debugger and REPL
- `sequel`: DB classes and methods
- `rails` framework for web application development
- `minitest`: Testing framework for ruby
- `simplecov`: Code Coverage tool.
- `bundler`: Dependency manager
- `rake`: Automation tool

### RVM and Rbenv ([Ruby Version Managers](https://launchschool.com/books/core_ruby_tools/read/ruby_version_managers))

RVm and Rbenv are ruby version managers. They allow you to have mutiple versions of Ruby installed at the same time and switch between them at will. This allows you to use version specific applications without sacrificing you ability to use the newest version.

- RVM has more features and works by dynamically managing your development environment.
- Rbenv does not initially include as many features, but allows you to install "plugins" that give more functionality. Works by modifying your environment variables.

### Bundler ([Bundler](https://launchschool.com/books/core_ruby_tools/read/bundler))

Bundler is a dependency manager. It is used to allow you to configure which Ruby and which Gems each of your projects need.

Bundler is installed by default with Ruby versions 2.5 or higher, but Bundler can be installed with:
```
gem install bundler
```

### Rake

Rake is an automation tool used to automate common functions required to build, test, package, and install ruby programs. It is automatically installed with ruby.

Rake uses a file named `Rakefile` that describes tasks that Rake can perform. You can use ruby code inside the `Rakefile` and run it as part of a task.

A `Rakefile` might look like this:

```Rakefile
require "rake/testtask"

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
```

## Gemfiles ([Setting Up The Gemfile ](https://launchschool.com/lessons/2fdb1ef0/assignments/61b773fd))
### Gemfile

The `Gemfile` is used by Bundler to determine the dependencies of a project. A `Gemfile` typically needs four pieces of information:
 - Where to look for Rubygems it needs to install?
 - Is a `.gemspec` file needed?
 - What version of Ruby is required?
 - What Rubygems does your program use?

A small `Gemfile` might look like this:

```gemfile
source 'https://rubygems.org'

ruby '2.6.0'

gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
```

### Gemfile.lock

`Gemfile.lock` is a file that is generated by running the command `bundle install`. It contains the complete dependency list of all gems listed by the `Gemfile`.

Bundler uses both `Gemfile` and `Gemfile.lock` to work. When updating your `Gemfile`, you should run `bundle install` to update your `Gemfile.lock`.

A `gemfile.lock` might look like this:
```gemfile
GEM
  remote: https://rubygems.org/
  specs:
    ansi (1.5.0)
    builder (3.2.4)
    minitest (5.14.0)
    minitest-reporters (1.4.2)
      ansi
      builder
      minitest (>= 5.0)
      ruby-progressbar
    ruby-progressbar (1.10.1)

PLATFORMS
  ruby

DEPENDENCIES
  minitest (~> 5.10)
  minitest-reporters (~> 1.1)

RUBY VERSION
   ruby 2.6.0

BUNDLED WITH
   2.1.4
```

### Gemspec ([Preparing a Rubygem](https://launchschool.com/lessons/2fdb1ef0/assignments/918536a2)

gemspec allows you to create your own ruby gem. By adding `gemspec` to your `Gemfile` and creating a `.gemspec` file, you are telling ruby what it needs to know to generate a gem from your code.

A `.gemspec` file might look like this:
```gemspec
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Pete Williams']
  s.email       = 'pw@example.com'
  s.homepage    = 'http://example.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
```

You can use rake to build your gem by adding this to your `Rakefile`:

```Rakefile
require "bundler/gem_tasks"
```

You can run `rake build` to build your gem, `rake install` to build then install the gem on your local system, and `rake release` to send your `.gem` file to the remote Rubygems library for public use.
