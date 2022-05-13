require 'rspec'
require 'pry'
require 'definition'
require 'word'

describe '#definition' do
  before(:each) do
    Word.clear()
    Definition.clear()
    @
  end