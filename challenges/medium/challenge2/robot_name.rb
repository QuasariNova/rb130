# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings,
# which means that their name gets wiped. The next time you ask, it will
# respond with a new random name.

# The names must be random; they should not follow a predictable sequence.
# Random names means there is a risk of collisions. Your solution should not
# allow the use of the same name twice.

# rules
# - Robot class
#   - has a @name getter
#   - when instatiated generates a random name of two capital letters and 3
#     digits
#     - names must be unique among instances
#   - has reset method
#     - generates a new name

# a
# #name
#   - return name if @name is not nil
#   - Otherwise generate random name until @@used_names does not include the
#     name
#   - add name to @@used_names
#   - return name

# #reset
#   - Set @name to nil


class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = (1..9).to_a
  @@used_names = []

  def name
    if @name.nil?
      @name = generate_name while @name.nil? || @@used_names.include?(@name)
      @@used_names << @name
    end
    @name
  end

  def reset
    @@used_names.delete @name
    @name = nil
  end

  private

  def generate_name
    name = 2.times.with_object([]) { |_,obj| obj << LETTERS.sample }
    name += 3.times.with_object([]) { |_,obj| obj << NUMBERS.sample }
    name.join
  end
end
