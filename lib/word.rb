class Word
    attr_reader :id, :name, :definitions

    @@words = {}
    @@total_rows = 0

    def initialize(name, definitions, id)
        @name = name
        @definitions = definitions
        @id = id || @@total_rows += 1
    end

    def self.all
        @@words.values()
    end

    def ==(word_to_compare)
        self.name() == word_to_compare.name()
    end

    def save
        @@words[self.id] = Word.new(self.name, self.definitions, self.id)
    end
end