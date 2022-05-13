require 'rspec'
require 'pry'
require 'word'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe ('.all') do 
    it("returns an empty string when there are no words") do 
      expect(Word.all).to(eq(""))
    end
  end
  describe ('#==') do 
    it('is the same word with same attributes as another word') do 
      word = Word.new('car', nil)
      word2 = Word.new('car', nil)
      expect(word).to(eq(word2))
    end
  end 
  describe('#save') do 
    it('saves words') do
      word = Word.new('cat', nil)
      word.save()
      word2 = Word.new('fire', nil)
      word2.save()
    end
  end 
  describe('#update') do
    it('updates an word by id') do
      word1 = Word.new("green", 1)
      word1.save()
      word1.update("red")
      expect(word1.word()).to(eq("red"))
    end
  end
end