# Write a program that takes a word and a list of possible anagrams and selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists",
# "google", "inlets", and "banana", the program should return a list containing
# "inlets". Please read the test suite for the exact rules of anagrams.

# Rules
# - Anagram object is instantiated with a string
# - Anagram has an instance method named match that takes an array of strings as
#   an argument.
# - match returns an array of strings that are anagrams of the string
#   initialized inside the Anagram object
# - an anagram is where two strings have the same characters in different orders
# - anagrams are case insensitive
# - the same word is not an anagram of itself
# - each string have to have equal length to be an anagram of each other
# - return array's order does not matter

# e
# "listen" | ["enlists", "google", "inlets", "banana"] => ["inlets"]
# "pow" | ['po', 'pow'] => []

# d
# Array, String

# a
# #initialize
# - Given a string, set @string to that string

# #match
# - Given an array of strings named strings
# - set results to an empty array
# - convert to downcase
# - iterate over each potential_anagram in strings
#   - if potential_anagram is an anagram, add to results
#     - check if strings are equal, return false if so
#     - return if sorted characters equal each other
# - return results

class Anagram
  def initialize(string)
    @string = string.downcase
  end

  def match(strings)
    strings.select do |potential_anagram|
      anagram? potential_anagram.downcase
    end
  end

  private

  def anagram?(potential_anagram)
    return false if @string == potential_anagram
    @string.chars.sort == potential_anagram.chars.sort
  end
end
