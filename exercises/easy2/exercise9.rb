# Write a method called each_cons that behaves similarly for Arrays, taking the
# elements 2 at a time. The method should take an Array as an argument, and a
# block. It should yield each consecutive pair of elements to the block, and
# return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an
# argument, but must not use any other methods that iterate through an Array or
# any other collection.

def each_cons(collection)
  idx = 0

  until idx >= collection.size - 1
    yield collection[idx, 2]
    idx += 1
  end

  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
