#list of categories
class BookwormBuddy::Category
    attr_accessor :name, :url
    @@all = []

    # initialize with an array of bestsellers 
    def initialize(category_hash)
        category_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
    end


end