require 'benchmark'
class NumberToWord
  LastIndex = 9
  def initialize
    @results = {}
    @compound_words = []
    @mapping = {
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }
  end

  def dump_dictionary_words
    @dictionary = {}
    (2..30).each {|i| @dictionary[i] = [] }
    file_path = "dictionary.txt"
    File.foreach(file_path) do |word|
      @dictionary[word.length] << word.chop.to_s.downcase if word.length >= 3
    end
  end

  def number_to_word_mapping number
    @number_to_word_mapping = number.chars.map{ |digit| @mapping[digit] }
  end

  def valid? number
    number.nil? || number.length != 10
  end
  
  def letter_combinations(number)
    unless valid? number 
      dump_dictionary_words
      mapped_list = number_to_word_mapping number
      
      (2..LastIndex - 2).each do |i|
        array_list = mapped_list[0..i]
        prefix_list = array_list.shift.product(*array_list).map(&:join)

        array_list = mapped_list[i + 1..LastIndex]
        suffix_list = array_list.shift.product(*array_list).map(&:join)

        @results[i] = [(prefix_list & @dictionary[i+2]), (suffix_list & @dictionary[LastIndex - i +1])]
      end
   
      @results.values.each do |words|
        words.first.product(words.last).each { |combo_words| @compound_words << combo_words }
      end
      @compound_words << (mapped_list.shift.product(*mapped_list).map(&:join) & @dictionary[11]).join(", ")
      @compound_words
    else
      puts "invalid number"
    end
  end
end 

compound_words = NumberToWord.new().letter_combinations("2282668687")
print compound_words
