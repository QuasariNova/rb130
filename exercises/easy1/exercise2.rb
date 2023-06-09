# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further Exploration:
# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new
# version of compute, including a no-block call.

def compute(value)
  return 'Does not compute.' unless block_given?
  yield value
end

p compute(nil) { 5 + 3 } == 8
p compute('a') { |val| val + 'b' } == 'ab'
p compute([1]) == 'Does not compute.'
