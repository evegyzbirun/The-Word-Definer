
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do 
  it('creates a word and then goes to the word list page') do
    visit("/words")
    click_on('Add a new word')
    fill_in('word_name', :with => 'good')
    click_on('Go!')
    expect(page).to have_content('good')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to word page') do 
    word = Word.new("run", nil)
    word.save
    definition = Definition('moving fast', nil, nil)
    definition.save
    visit("/words/#{word.id}/definitions/")
    fill_in("defin_name", :with => 'moving fast')
    click_link_or_button('Add definition')
    expect(page).to have_content('moving fast')
  end
end
