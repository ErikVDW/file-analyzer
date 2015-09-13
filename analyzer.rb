line_count = 0
text = ''
stop_words = %w(and be the a by on for of are with just but to the my I has some in)
File.open("text.txt").each do |line| 
  line_count += 1
  # Could add text this way, making the entire text from the file one long, continuous string
  # text << line
end

puts line_count
lines = File.readlines "text.txt"
line_count2 = lines.count
text = lines.join(" ") # Notice this shows us that the readlines method creates an array of the lines in the document. 
total_characters = text.length # Smartly convert the array to a string before we determine the number of characters
spaceless_characters = text.gsub(/ /, "").length
sentence_count = text.split(/\.|!|\?/) 
puts line_count2
puts total_characters
puts spaceless_characters
puts "This9 is a test.".scan(/\w+/) # scan creates an array consisting of any characters matching the test, which we can join to make a legible string!  Hooray!
# \w - Alphanumerics
# \d - Digits
# \s - Whitespaces
# + - Makes the element added to the array the matching the metacharacter to be all of the characters including it and after it until a non-matching character is met.
# | - or <- love this one
# Counting words
# Easy way
puts text.split.length # Counts the number of elements of the array created from text
# More accurate way
puts text.scan(/\w+/).length 
puts text.scan(/\n\n/).length # Number of paragraphs

valueable_word_count = text.scan(/\w+/).select {|word| !stop_words.include?(word)}.length
puts valueable_word_count