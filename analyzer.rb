# We'll be counting the number of lines and storing some text
line_count = 0
text = ''

# Start by just counting the lines
File.open("text.txt").each do |line| 
  line_count += 1
  # Could store text as below, making the entire text from the file one long, continuous string
  # text << line
end

# An alternative way to get line count and various character counts
lines = File.readlines "text.txt"
line_count2 = lines.count

text = lines.join(" ") # Notice this shows us that the readlines method creates an array of the lines in the document. 
total_characters =     text.length
spaceless_characters = text.gsub(/ /, "").length
sentence_count =       text.split(/\.|!|\?/).length

puts "Line Count:".ljust(25, ".") + " #{line_count2}"
puts "Total Characters:".ljust(25, ".") + " #{total_characters}"
puts "Spaceless Characters:".ljust(25, ".") + " #{spaceless_characters}"
puts "Sentence Count:".ljust(25, ".") + " #{sentence_count}"

all_words = text.scan(/\w+/) # scan creates an array consisting of any characters matching the test, which we can join to make a legible string!  Hooray!
# \w - Alphanumerics
# \d - Digits
# \s - Whitespaces
# + - Makes the element added to the array the matching the metacharacter to be all of the characters including it and after it until a non-matching character is met.
# | - or <- love this one

# Counting words
# Easy way
word_count = text.split.length # Counts the number of elements of the array created from text
puts "Word Count:".ljust(25, ".") + " #{word_count}"

# More accurate way
better_word_count = text.scan(/\w+/).length 
puts "Better Word Count:".ljust(25, ".") + " #{better_word_count}"

paragraph_count = text.scan(/\n\n/).length + 1
puts "Paragraph Count:".ljust(25, ".") + " #{paragraph_count}"

# Count the number of meaningful words in the text
stop_words = %w(and be the a by on for of are with just but to the my I has some in)
valueable_word_count = text.scan(/\w+/).select {|word| !stop_words.include?(word)}.length
puts "Valueable Words:".ljust(25, ".") + " #{valueable_word_count}"
