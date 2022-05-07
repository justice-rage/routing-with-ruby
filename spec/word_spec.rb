require 'rspec'
require 'word'

describe('#save') do
    it("saves a word") do
        word1 = Word.new("humanoid", "looking or acting like a human beibng", nil)
        word1.save()
        word2 = Word.new("humanoid", "looking or acting like a human beibng", nil)
        word2.save()
        expect(Word.all).to(eq([word1, word2]))
    end
end

describe('.clear') do
    it("clears all words") do 
        word1 = Word.new("bird", "organism with feathers", nil)
        word1.save()
        word2 = Word.new("reptile", "organism with scales", nil)
        word2.save()
        Word.clear()
        expect(Word.all).to(eq([]))
    end
end


describe '#Word' do

    before(:each) do
        Word.clear()
    end

    describe('.all') do
        it("returns an empty array when there are no words") do
            expect(Word.all).to(eq([]))
        end
    end


    describe('#==') do
        it("is the same word if it has the same attributes as another word ") do
            word1 = Word.new("cat", "sharp clawed small mammals that pretend they don't love you", nil)
            word2 = Word.new("cat", "sharp clawed small mammals that pretend they don't love you", nil)
            expect(word1).to(eq(word2))
        end
    end

    describe('.find') do
        it("finds a word by id") do
            word1 = Word.new("mammal", "organism with fur", nil)
            word1.save()
            word2 = Word.new("amphibian", "semiaquatic reptile-like organisms with delicate skin", nil)
            word2.save()
            expect(Word.find(word1.id)).to(eq(word1))
        end
    end

    describe('#update') do
        it("updates a word name by id") do
            word1 = Word.new("Montain", "a large geological formation", nil)
            word1.save()
            word1.update("mountain")
            expect(word1.name).to(eq("A love supreme"))
        end
    end
end