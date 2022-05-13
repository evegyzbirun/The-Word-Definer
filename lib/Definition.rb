require('sinatra')
require('sinatra/reloader')
require('./lib/Definition')
require('pry')
also_reload('lib/**/*.rb')


class Definition
  attr_reader :id
  attr_accessor :definition, :word_id
  @@definitions = {}
  @@total_definitions = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_definitions += 1
  end

  def self.all
    @@definitions.values()
  end

  def ==(definition_to_compare)
    self.definition() == definition_to_compare.definition()
  end

 

  def self.clear
    @@definitions = {}
   
   
  end

  def save 
    @@definitions[self.id] = Definition.new(self.definition, self.word_id, self.id)
  end

  def update (definition ,word_id)
    @word_id = word_id
    @definition = definition
  end

  def delete
    @@definitions.delete(self.id)
  end
  
  def self.find(id)
    @@definitions[id]
  end

  
end