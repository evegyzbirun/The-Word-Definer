require 'rspec'
##require 'pry'
require 'word'

describe '#Word' do
  before(:each) do
    word.clear()
  end

  describe ('.all') do 
    it("returns an empty string when there are no words") do 
      expect(Word.all).to(eq())
    end
  end
end