require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("giant", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition1 = Definition.new("blue", @word.id, nil)
      definition2 = Definition.new("blue", @word.id, nil)
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("random definition2", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("random definition2", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      expect(Definition.all).to(eq([definition1]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("random definition2", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition2))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      definition1.update("random definition1 update", @word.id)
      expect(definition1.name).to(eq("random definition1 update"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition1 = Definition.new("random definition1", @word.id, nil)
      definition1.save()
      definition2 = Definition.new("random definition2", @word.id, nil)
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end