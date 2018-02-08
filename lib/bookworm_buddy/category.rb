#list of categories
require 'pry'
class BookwormBuddy::Category
    attr_accessor :name, :url, :bestsellers
    @@all = []
    

    # initialize with a name and url  
    def initialize(category_hash)
        category_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
        @bestsellers = []
    end

    def self.create(category_array)
        category_array.each {|category| self.new(category)}
    end

    def list_categories
        @@all.each_with_index {|category, index| puts "#{index+1}. #{category[:name]}"}
    end 

    def add_bestsellers(bestsellers_array)
        @bestsellers << bestsellers_array 
    end
    
end