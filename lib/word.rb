class Word
    @@words = {}

    def initialize(name, definitions)
        @name = name
        @definitions = definitions
    end

    def self.all
        @@words.values()
    end
end