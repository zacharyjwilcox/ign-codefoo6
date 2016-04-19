#! /usr/bin/env ruby
#Zach Wilcox
puts
#intro

puts "This program finds words if the required letters are there. "
puts "I couldn't get it to work with extra letters, but if you watch the"
puts "video, you'll see that I taught myself to program this in a "
puts "week. Sorry for the long block of text."
puts
puts "Thank you for choosing Zach's Scrabble word looker upper!"
puts "To begin, enter the letters you have, separated by commas. No spaces, please."
puts
#time to get your letters
letter_choice = gets.chomp
letter_choice = letter_choice.split(/,\s*/)
letter_choice.push "\r"
letter_choice.sort!

#If I were to do this again, I'd have the letter_scores hash
# in another file and read it from this file.
letter_scores = {
	"a" => 1,
	"b" => 3,
	"c" => 3,
	"d" => 2,
	"e" => 1,
	"f" => 4,
	"g" => 2,
	"h" => 4,
	"i" => 1,
	"j" => 8,
	"k" => 5,
	"l" => 1,
	"m" => 3,
	"n" => 1,
	"o" => 1,
	"p" => 3,
	"q" => 10,
	"r" => 1,
	"s" => 1,
	"t" => 1,
	"u" => 1,
	"v" => 4,
	"w" => 4,
	"x" => 8,
	"y" => 4,
	"z" => 10,
	"\r" => 0
}
# array = []
scrabble_words = IO.foreach("scrabble_words.txt")
word_scores = Hash.new{0}
scrabble_words.each do |word|
	scan_word = word.scan(/./)
	score = 0
#	array.push(word,scan_word)
	scan_word.each do |i|
		a = letter_scores[i]
		a.to_i
		score+=a	
	end
	word_scores[word] = score
	score = 0
end
#SO after MUCH trouble, the list finally, FINALLY has scores
#for each word

# puts "Let me think about that"
# puts letter_choice

#time to see if the letters are in the word
final_word_array = []
scrabble_words.each do |word|
	final_word_array.push([word,word.scan(/./).sort])
end


final_word_array.each do |word|
	last_call = []
	if word[1]-letter_choice == []
		last_call.push(word)
		last_call.each do
			if letter_choice - word[1] ==[]
				puts word[0]
			end
		end
	end
end


puts "Thanks, IGN! Hope to hear back soon!"

# array.each do |word|
# 	puts word
# end








