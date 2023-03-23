# Write a program that can calculate the Hamming distance between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying of
# a nucleic acid, in particular DNA. Because nucleic acids are vital to
# cellular functions, mutations tend to cause a ripple effect throughout the
# cell. Although mutations are technically mistakes, a very rare mutation may
# equip the cell with a beneficial attribute. In fact, the macro effects of
# evolution are attributable to the accumulated result of beneficial
# microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands
# taken from different genomes with a common ancestor, we get a measure of the
# minimum number of point mutations that could have occurred on the
# evolutionary path between the two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

# Rules
# - DNA object is constructed of a string
# - Has an instance method hamming_distance that takes a string as an argument
#   and returns an integer
# - Hamming distance is the number of character differences between the string
#   stored in the DNA object and the string passed as an argument
# - Can only calculate distance on two strings of the same lenght, thus we only
#   search over the smaller of the two strings.

# e
# CAT
# GAT
# => 1

# GACCT
# GAGCATG
# => 2

#
# GAGC
# => 0

# d
# Strings

# a
# #initialize
#   - Given a string, store the string in instance variable @strand

# #hamming_distance
#   - Given a string distance
#   - Determine which is longer @strand or distance and store that lenght in
#     length
#   - store 0 to diffs
#   - Iterate over @strand and distance length number of characters
#     - if @strand != distance at each character, add 1 to diffs
#   - return diffs

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    length = [strand.size, distance.size].min
    diffs = 0

    length.times { |idx| diffs += 1 unless strand[idx] == distance[idx] }

    diffs
  end
end
