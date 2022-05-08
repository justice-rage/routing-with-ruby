require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and routes to word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'medusa')
    click_on('Go!')
    expect(page).to have_content('medusa')
  end
end

describe('create a edit word path', {:type => :feature}) do
  it('routes to edit word page and changes word') do
    word = Word.new("medusa", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'mapinguary')
    click_on('Update')
    expect(page).to have_content('mapinguary')
  end
end

describe('create a delete word path', {:type => :feature}) do
  it('routes to edit word page and deletes a word') do
    Word.clear()
    word = Word.new("medusa", nil)
    word.save
    word2 = Word.new("bunyip",nil)
    word2.save
    visit("/words/#{word.id}/edit")
    click_on('Delete')
    expect(page).to have_no_content('medusa')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word definition') do
    word = Word.new("medusa", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'basilisk')
    click_on('Add definition')
    expect(page).to have_content('basilisk')
  end
end

describe('create an edit definition path', {:type => :feature}) do
  it('routes to edit word page and changes word') do
    Word.clear()
    word = Word.new("medusa", nil)
    word.save()
    definition= Definition.new("basilisk", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("name", :with => 'scary chicken')
    click_on('Update definition')
    expect(page).to have_content('scary chicken')
  end
end

describe('create a delete definition path', {:type => :feature}) do
  it('routes to edit definition page and deletes a definition') do
    Word.clear()
    word = Word.new("medusa", nil)
    word.save()
    definition= Definition.new("basilisk", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on('Delete definition')
    expect(page).to have_no_content('basilisk')
  end
end