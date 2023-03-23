# You'll need the following tile scores:
# Letter 	Value
# A, E, I, O, U, L, N, R, S, T 	1
# D, G 	2
# B, C, M, P 	3
# F, H, V, W, Y 	4
# K 	5
# J, X 	8
# Q, Z 	10

# How to Score

# Sum the values of all the tiles used in each word. For instance, lets
# consider the word CABBAGE which has the following letters and point values:

#     3 points for C
#     1 point for each A (there are two)
#     3 points for B (there are two)
#     2 points for G
#     1 point for E

# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

# rules
# - The Scrabble object is instantiated with a string
# - The string is case insensitive
# - Each letter has a value, non alphabetical characters are worth 0
# - The score instance method determines the value of the string
# - score is a sum of the values
# - Scrabble has a class method score that will invoke instance score

# e
# 'cabbage' => 14
# '  ' => 0
# 'chris' => 10

# d
# String, hash (regex => value)

# a
# #initialize
#   - set @word to given string

# #score
#   - return 0 if @word is nil
#   - set value to 0
#   - Apply each regex over @word
#     - For each match, add the value of the regex to value
#   - return value

class Scrabble
  POINTS = {/[aeioulnrst]/i => 1, /[dg]/i => 2, /[bcmp]/i => 3,
            /[fhvwy]/i => 4, /k/i => 5, /[jx]/i => 8,
            /[qz]/i => 10}

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    score = 0
    POINTS.each do |regex, value|
      score += @word.scan(regex).size * value
    end

    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
