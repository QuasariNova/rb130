# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

# def missing(arr)
#   arr.first.upto(arr.last).with_object([]) do |int, obj|
#     obj << int unless arr.include? int
#   end
# end

# Further Exploration
# Can you find other ways to solve this problem? What methods might prove useful?

# I did not use each_cons, which will iterate over overlapping subarrays of the
# size passed in sequence. It stands for each consecutive sequence. This was
# the launch school solution.

# Can you find a way to solve this without using a method that requires a block?

def missing(arr)
  (arr.first..arr.last).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
