#list of categories
class BookwormBuddy::Category
    attr_accessor :name, :url
    @@all = []

    # initialize with a name and url  
    def initialize(category_hash)
        category_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
    end

    def self.create(category_array)
        category_array.each {|category| Category.new(category)}
    end

    #add list of bestsellers to each category
    def add_bestsellers(#bestsellers array)

    end

    
end