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
        ALL.each.with_index(1) {|category, index| puts "#{index}. #{category.name}"}
    end 
end