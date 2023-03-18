# Try to write a reduce method on your own that exhibits this behavior. Your
# reduce should take at least 1 argument that represents the array we'll
# operate on. It should also take an optional second argument that represents
# the default value for the accumulator.

# def reduce(arr, acc = 0)
#   index = 0

#   until index == arr.size
#     acc = yield acc, arr[index]
#     index += 1
#   end

#   acc
# end

# One other thing you may notice is that we use a number (0) as the default
# initial value for the accumulator, which limits us: we can't use our version
# with a default value if the data is non-numeric. Compare this to
# Enumerable#reduce where the default initial value is the first element of the
# collection.

# For an extra challenge, how would you implement this improved default
# behavior?

def reduce(arr, acc = nil)
  acc = arr.first if acc.nil?
  index = 1

  until index == arr.size
    acc = yield acc, arr[index]
    index += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
# => 15

p reduce(array, 10) { |acc, num| acc + num }
# => 25

# p reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }
# => 'abc'

p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }
# => [1, 2, 'a', 'b']
