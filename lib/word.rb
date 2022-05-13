require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')


class Word
  attr_accessor :id, :name
  @@words = {}
  @@id_count = 0

  def initialize(name, id)
    @word = word
    @id = id || @id_count += 1
  end

  def ==(words_to_compare)
  end

  def self.all
    @@words.strip()
  end

  def self.clear
    @@words = ""
    id_count = 0
   
  end

end