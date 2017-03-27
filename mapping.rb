require 'benchmark'

class NumberToWord
  def initialize
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
end
obj = NumberToWord.new()
