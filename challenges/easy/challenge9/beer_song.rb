# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

# Rules
# - We don't need an object
# - Class/Module is BeerSong
# - it has three class/module methods:
#   - ::verse which takes an integer >= 0 and returns a string with the verse
#   - ::verses which takes two integers >= 0 and returns all the verses from
#     the first downto the second
#   - ::lyrics which calls verses from 99 to 0

# a
# ::verse
#   - Given an integer bottles
#   - format a string using bottles
#   - if bottles = 0, format a different string
#   - return string

# ::verses
#   - Given two integers start, stop
#   - create an empty string song
#   - Iterate over every number start downto stop
#     - concatenate the verse onto song
#     - if it is not stop, add an empty line
#   - return song

class BeerSong
  def self.verse(bottle)
    bottles = bottles_string(bottle)
    verse = "#{bottles.capitalize} of beer on the wall, #{bottles} of beer.\n"

    if bottle.zero?
      verse += "Go to the store and buy some more, 99 bottles of beer on the" \
        " wall.\n"
    else
      bottles = bottles_string(bottle - 1)
      verse += "Take #{bottle == 1 ? 'it' : 'one'} down and pass it " \
        "around, #{bottles} of beer on the wall.\n"
    end

    verse
  end

  def self.verses(start, stop)
    song = ''

    start.downto(stop) do |bottles|
      song += verse bottles
      song += "\n" unless bottles == stop
    end

    song
  end

  def self.lyrics
    self.verses 99, 0
  end

  class << self
    private

    def bottles_string(bottle)
      bottles = bottle.zero? ? 'no more' : bottle.to_s
      bottles += (bottle == 1 ? ' bottle' : ' bottles')
      bottles
    end
  end
end
