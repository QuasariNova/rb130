# Meetups are a great way to meet people who share a common interest.
# Typically, meetups happen monthly on the same day of the week. For example, a
# meetup's meeting may be set as:

#     The first Monday of January 2021
#     The third Tuesday of December 2020
#     The tenth Wednesday of December 2020
#     The last Thursday of January 2021

# In this program, we'll construct objects that represent a meetup date. Each
# object takes a month number (1-12) and a year (e.g., 2021). Your object
# should be able to determine the exact date of the meeting in the specified
# month and year. For instance, if you ask for the 2nd Wednesday of May 2021,
# the object should be able to determine that the meetup for that month will
# occur on the 12th of May, 2021.

# The descriptors that may be given are strings: 'first', 'second', 'third',
# 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not
# important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is
# a made up word. There was a meetup whose members realised that there are
# exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each
# day of the week (Monday, Tuesday, ...) will have exactly one date that is the
# "teenth" of that day in every month. That is, every month has exactly one
# "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may
# not happen every month, but some meetup groups like that irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday',
# 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case
# of the strings is not important.

# rules
# - Meetup Class
#   - initialize takes a year and a month
#   - #day method takes two strings day and frequency
#     - returns nil if there is no meetup date in that month
#     - iterates over the month looking for a day that matches day and freq
#     - returns Date.civil if it finds it
# - day and frequency are case insensitive

require 'date'

class Meetup
  FREQUENCY = {'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4,
               'fifth' => 5 }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, frequency)
    return last_day day if frequency.downcase == 'last'
    return teenth_day day if frequency.downcase == 'teenth'
    date = Date.civil(@year, @month, 1)
    occurences = 0

    until date.month != @month
      occurences += 1 if is_day?(date, day)
      return date if occurences == FREQUENCY[frequency.downcase]
      date = date.next
    end

    nil
  end

  private

  def is_day?(date, day)
    date.send "#{day.downcase}?".to_sym
  end

  def last_day(day)
    date = Date.civil(@year, @month, 1).next_month.prev_day
    date = date.prev_day until is_day? date, day

    date
  end

  def teenth_day(day)
    date = Date.civil(@year, @month, 13)
    date = date.next_day until is_day? date, day

    date
  end
end
