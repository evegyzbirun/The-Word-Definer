require 'rspec'
require 'pry'
require 'word'

describe '#word' do
  before(:each) do
    word.clear()
  end

  describe('.all') do 
    it("returns an empty string when there are no words") do 
      expect(word.all).to(eq())
    end
  end
end