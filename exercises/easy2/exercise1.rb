# Write a method that does the same thing as Range#step, but does not operate
# on a range. Instead, your method should take 3 arguments: the starting value,
# the ending value, and the step value to be applied to each iteration. Your
# method should also take a block to which it will yield (or call) successive
# iteration values.

def step(start, stop, step_value)
  value = start

  until value > stop
    yield value
    value += step_value
  end

  value
end

# What do you think would be a good return value for this method, and why?

# There are 3 possible return values I think would be good:
# First we have a range from start to stop. It would be like the original and
# we are still iterating over a range, so it makes sense to return that.

# Second we return the last value as it was the last value.

# Finally, we could return an array of the values that were passed to the block.
# These values are what were stepped through, so it makes sense that they would
# be returned.

step(1, 10, 3) { |value| puts "value = #{value}" }
