# Write a method called drop_while that behaves similarly for Arrays. It should
# take an Array as an argument, and a block. It should return all the elements
# of the Array, except those elements at the beginning of the Array that
# produce a truthy value when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every
# element, drop_while should return an empty Array.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an
# argument, but must not use any other methods that iterate through an Array or
# any other collection.

def drop_while(collection)
  collection.each_with_index do |value, idx|
    return collection[idx..-1] unless yield value
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
