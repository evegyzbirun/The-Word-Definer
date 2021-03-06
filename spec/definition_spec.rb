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
      definition1 = Definition.new("to be desired or approved of", @word.id, 1)
      definition1.save()
      definition2 = Definition.new('that which is morally right', @word.id, 2)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end
  describe ('#==') do 
  it('is the same definition with same attributes as another word') do 
    definition1 = Definition.new('to be desired or approved of',@word.id, 1)
    definition2 = Definition.new('to be desired or approved of',@word.id, 1)
    expect(definition1).to(eq(definition2))
    end
  end


    describe('#save') do 
    it ('saves words') do
      definition1 = Definition.new("to be desired or approved of", @word.id, nil)
      definition1.save()
      definition2 = Definition.new('that which is morally right', @word.id, nil)
      definition2.save()
    expect(Definition.all).to(eq([definition1, definition2]))
    end
  end 
    describe('#update') do 
    it ('updates a definition by id') do
      definition1 = Definition.new('to be desired or approved of', @word.id, nil)
      definition1.save()
      definition1.update('that which is morally right', @word.id)
      expect(definition1.name).to(eq('that which is morally right'))
    end
  end
    describe('#delete') do
      it ('delete definition by id') do
        definition1 = Definition.new('to be desired or approved of', @word.id, nil)
        definition1.save()
        definition2 = Definition.new('that which is morally right', @word.id, nil)
        definition2.save()
        definition1.delete()
        expect(Definition.all).to(eq([definition2]))
      end
    end
    describe('.clear') do
      it ('clears all definitions') do
        definition1 = Definition.new('to be desired or approved of', @word.id, nil)
        definition1.save()
        definition2 = Definition.new('that which is morally right', @word.id, nil)
        definition2.save()
        Definition.clear()
        expect(Definition.all).to(eq([]))
      end
    end
    describe('.find') do
      it ('find a definition by id') do
        definition1 = Definition.new('to be desired or approved of', @word.id, nil)
        definition1.save()
        definition2 = Definition.new('that which is morally right', @word.id, nil)
        definition2.save()
        expect(Definition.find(definition1.id)).to(eq(definition1))
      end
    end
    describe('.find_by_word') do
      it('find defenitions by a word') do
        word1 = Word.new('fight', nil)
        word1.save()
        definition1 = Definition.new("competition with someone", word1.id, nil)
        definition1.save()
        definition2 = Definition.new("boxing", @word.id, nil)
        definition2.save()
       
        expect(Definition.find_by_word(word1.id)).to(eq([definition1]))
      end
    end
    describe('#word') do
      it("find the word using a definition") do
        definition = Definition.new("to be desired or approved of", @word.id, nil)
        definition.save()
        expect(definition.word()).to(eq(@word))
      end
    end
end
