require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')


class Word
  attr_accessor :id, :word
  @@words = {}
  @@total_lines = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_lines += 1
  end

  def ==(words_to_compare)
    self.word() == words_to_compare.word()
  end

  def self.all
    @@words.strip()
  end

  def self.clear
    @@words = ""
    id_count = 0
   
  end

  def save 
    @@words = Word.new(self.word, self.id)
  end

  def update (word)
    @word = word
  end
end