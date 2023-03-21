# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

# 1)
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |*three, one|
  puts three.join(', ')
  puts one
end

# 2)
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |apple, *two, wheat|
  puts apple
  puts two.join(', ')
  puts wheat
end

# 3)
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |one, *three|
  puts one
  puts three.join(', ')
end

# 4)
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, and #{wheat}"
end
