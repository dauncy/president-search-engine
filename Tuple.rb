class Tuple
    attr_reader :full_name, :presidency, :start_char, :end_char
    @@all = [ ]

    def initialize(full_name, presidency, start_char, end_char)
        @full_name = full_name
        @presidency = presidency
        @start_char = start_char
        @end_char = end_char

        @@all << self
    end 
    
    def self.all
        @@all
    end 

    def self.clear
        @@all = []
    end 
end 