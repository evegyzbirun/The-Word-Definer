
class Word
  attr_reader :name, :id
  @@words = {}
  @@total_lines = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_lines += 1
  end

  def self.all
    @@words.values()
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name() && self.id() == word_to_compare.id()
  end
  def delete
    @@words.delete(self.id)
  end
  
 

  def self.clear
    @@words = {}
    @@total_lines = 0
   
  end

  def save 
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def update (name)
    @name = name
  end
  
  
  def self.find(id)
    @@words[id]
  end
  
  def definitions
    Definition.find_by_word(self.id)
  end
end