require 'rspec'
require 'pry'
require 'word'

describe '#Word' do
  before(:each) do
    Word.clear()
  end

  describe ('.all') do 
    it("returns an empty array when there are no words") do 
      expect(Word.all).to(eq([]))
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
    it ('saves words') do
      word = Word.new('cat', nil)
      word.save()
      word2 = Word.new('fire', nil)
      word2.save()
    expect(Word.all).to(eq([word, word2]))
    end
  end 
  describe('#update') do
    it('updates an word by id') do
      word1 = Word.new("green", 1)
      word1.save()
      word1.update("red")
      expect(word1.name()).to(eq("red"))
    end
  end
  describe('#delete') do
    it ('delete word by id') do 
      word1 = Word.new('run', 2)
      word1.save()
      word2 = Word.new('jump', 3)
      word2.save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
  describe('.clear') do
    it('clears all words') do
    word1 = Word.new('fight', nil)
    word1.save()
    word2 = Word.new('good', nil)
    word2.save()
    Word.clear()
    expect(Word.all).to(eq([]))
    end
  end
  describe('.find') do
    it('find a word by id') do
      word1 = Word.new('player', nil)
      word1.save()
      word2 = Word.new('winter', nil)
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end
  describe('#definitions') do
    it('it returns word definitions') do
      word1 = Word.new("good", nil)
      word1.save()
      definition1 = Definition.new("to be desired or approved of", word.id, nil)
      definition1.save()
      definition2 = Definition.new('that which is morally right', word.id, nil)
      definition2.save()
      expect(word1.definitions).to(eq([definition1, definition2]))
    end
  end
 end