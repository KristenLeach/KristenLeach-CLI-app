#arrays of books from each category, & description?
class BookwormBuddy::Book
    attr_accessor :title, :author, :price, :description

    #initialized with attribute hash 
    def initialize(attribute_hash)
        bestseller_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
    end

    def description
        #prints description of individual book when called 
    end
    
end