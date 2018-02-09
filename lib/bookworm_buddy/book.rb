#arrays of books from each category, & description?
require 'pry'
class BookwormBuddy::Book
    attr_accessor :title, :author, :price, :description, :description_url
    ALL = []

    #initialized with attribute hash 
    def initialize(bestseller_hash)
        bestseller_hash.each {|key, value| self.send("#{key}=", value)}
        ALL << self 
        #binding.pry
    end

    def self.create(book_array)
        book_array.each {|book| self.new(book)}
    end

    def self.list_books_by_category(category_number)
        puts BookwormBuddy::Category::ALL[category_number.to_i - 1].name
        ALL.each_with_index {|book, index| puts "#{index+1}. \"#{book.title}\" - by: #{book.author} - #{book.price}"}
    end
    
    def self.list_description(description)
        puts "#{description}"
    end
end