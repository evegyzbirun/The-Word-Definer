require 'rspec'
require 'pry'
require 'definition'
require 'word'

describe '#definition' do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('good', nil)
    @word.save()
  end

  describe ('.all') do 
    it("returns a list of all definition ") do 
      definition1 = Definition.new("to be desired or approved of", @word_id, nil)
      definition1.save()
      definition2 = Definition.new('that which is morally right', @word_id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end
  describe ('#==') do 
  it('is the same definition with same attributes as another word') do 
    word = Definition.new('to be desired or approved of',@word_id, nil)
    word2 = Definition.new('to be desired or approved of',@word_id, nil)
    expect(definition1).to(eq(definition2))
  end
end 

end