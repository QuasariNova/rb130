# Try to write a reduce method on your own that exhibits this behavior. Your
# reduce should take at least 1 argument that represents the array we'll
# operate on. It should also take an optional second argument that represents
# the default value for the accumulator.

def reduce(arr, acc = 0)
  index = 0

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

p reduce(array) { |acc, num| acc + num if num.odd? }
# => NoMethodError: undefined method `+' for nil:NilClass
