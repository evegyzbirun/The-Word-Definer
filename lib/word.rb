


class Word
  attr_reader :id
  attr_accessor :word
  @@words = {}
  @@total_lines = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_lines += 1
  end

  def self.all
    @@words.values()
  end

  def == (words_to_compare)
    self.word() == words_to_compare.word()
  end

 

  def self.clear
    @@words = {}
    @@total_lines = 0
   
  end

  def save 
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def update (word)
    @word = word
  end
  def delete
    @@words.delete(self.id)
  end
  
  def self.find(id)
    @@words[id]
  end
  def definition
    Definition.find_word(self.id)
  end
end