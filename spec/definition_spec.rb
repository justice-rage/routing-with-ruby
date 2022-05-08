require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("golem", nil)
    @word.save()
  end

  describe('#==')do
    it("is the same definition if it has the same attributes as another definition")do
      definition = Definition.new("rock person", @word.id, nil)
      definition2 = Definition.new("rock person", @word.id, nil)
      expect(definition).to eq(definition2)
    end
  end
  describe('.all')do
    it("returns an array of all definitions")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      definition2 = Definition.new("dirt human", @word.id, nil)
      definition2.save()
      expect(Definition.all).to eq([definition, definition2])
    end
  end
  describe('.clear')do
    it("clears all definitions")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      definition2 = Definition.new("dirt human", @word.id, nil)
      definition2.save
      Definition.clear
      expect(Definition.all).to eq([])
    end
  end
  describe('#save')do
    it("saves a definition")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      expect(Definition.all).to eq([definition])
    end
  end
  describe('.find')do
    it("finds a definition by id")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      definition2 = Definition.new("dirt human", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to eq(definition)
    end
  end
  describe('#update')do
    it("updates a definition by id")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      definition.update("mineral person", @word.id)
      expect(definition.name).to eq("mineral person")
    end
  end
  describe('#delete')do
    it("deletes a definition by id")do
      definition = Definition.new("rock person", @word.id, nil)
      definition.save()
      definition2 = Definition.new("crystal humanoid", @word.id, nil)
      definition2.save()
      definition.delete
      expect(Definition.all).to eq([definition2])
    end
  end
  describe('.find_by_word') do
    it("finds a word's definitions") do
      word2 = Word.new("dragon", nil)
      word2.save()
      definition = Definition.new("fire breathing reptile", @word.id, nil)
      definition.save()
      definition2 = Definition.new("giant flying reptile", word2.id, nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to eq([definition2])
    end
  end

end