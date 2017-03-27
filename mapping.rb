require 'benchmark'

class NumberToWord
  LastIndex = 9
  def initialize
    @results = {}
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

  def letter_combinations(number)
    dump_dictionary_words
    mapped_list = number_to_word_mapping number
    
    (2..LastIndex - 2).each do |i|
      array_list = mapped_list[0..i]
      prefix_list = array_list.shift.product(*array_list).map(&:join)

      array_list = mapped_list[i + 1..LastIndex]
      suffix_list = array_list.shift.product(*array_list).map(&:join)

    end
   
  end
end 

final_words = NumberToWord.new().letter_combinations("2282668687")
print final_words
