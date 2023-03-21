# Read the text file in the #process method and pass the text to the block
# provided in each call. Everything you need to work on is either part of the
# #process method or part of the blocks. You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample
# output but should have the indicated format.

class TextAnalyzer
  def process
    file = File.open 'exercise2.txt'
    yield file.readlines
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |lines|
  paragraphs = 1
  lines.each { |line| paragraphs += 1 if line.strip.empty? }
  puts "#{paragraphs} paragraphs"
end

analyzer.process { |lines| puts "#{lines.size} lines"}

analyzer.process do |lines|
  words = 0
  lines.each do |line|
    words += line.strip.split.size
  end
  puts "#{words} words"
end
