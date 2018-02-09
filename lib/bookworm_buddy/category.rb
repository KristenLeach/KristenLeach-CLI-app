require 'pry'
class BookwormBuddy::Category
    attr_accessor :name, :url, :bestsellers
    ALL = []
   
    def initialize(category_hash)
        category_hash.each {|key, value| self.send("#{key}=", value)}
        ALL << self 
    end

    def self.create(category_array)
        category_array.each {|category| self.new(category)}
    end

    def self.list_categories
        ALL.each_with_index {|category, index| puts "#{index+1}. #{category.name}"}   
    end 
    
end