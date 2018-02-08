#arrays of books from each category, & description?
class BookwormBuddy::Book
    attr_accessor :title, :author, :price, :description

    #initialized with attribute hash 
    def initialize(attribute_hash)
        bestseller_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
    end

    def self.create(book_array)

    end

    def list_books_by_category(category_number)
        @@bestsellers.each_with_index {|book, index| puts "#{index+1}. #{book[:title]} - by: #{book[:author]} - #{book[:price]}"} 
    end
    
end