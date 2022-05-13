class Word
  attr_accessor :id, :name
  @@words = {}
  @@id_count = 0

  def initialize(name, id)
    @name = name
    @id = id || @id_count += 1
  end

  def ==(words_to_compare)
  end

  def self.all
    @@words.values
  end
end