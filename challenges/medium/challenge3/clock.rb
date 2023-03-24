# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate Clock
# objects when adding and subtracting minutes -- create a new Clock object.

# Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic
# operations.

# Rules
# - Clock class
#   - ::at method
#     - Two arguments, hours and minutes. minutes has a default of 0
#     - Instantiates and returns a clock object
#   - #== method
#     - compares hours and minutes are the same between two clock objects
#   - #+ method
#     - Increases by minutes
#   - #- method
#     - Decreases by minutes
#   - # to_s method
#     - returns HH:MM string
# - Time is 24 hour time
# - date doesn't matter
# - can't use date or time functionality built in to ruby
# - adding and subtracting doesn't mutate

# a
# #initialize
#   - @hour set to 0
#   - @minute set to 0

# ::at
#   - Given two integers hours and minutes
#   - instatiate a new Clock object
#   - set hour to hours
#   - set minute to minutes

# #==
#   - Given another clock object
#   - compare hours and minutes are equal

# #+ & #-
#   - Given an integer
#   - Determine change in clock by minutes
#   - Create new object

class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def initialize(hours = 0, minutes = 0)
    @hour = hours
    @minute = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new hours, minutes
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def +(value)
    at_minutes_from minute + value
  end

  def -(value)
    at_minutes_from minute - value
  end

  def to_s
    format '%02d:%02d', hour, minute
  end

  protected

  attr_reader :minute, :hour

  private

  def at_minutes_from(minutes)
    hours, minutes = minutes.divmod MINUTES_IN_HOUR
    Clock.new (hour + hours) % HOURS_IN_DAY, minutes
  end
end
