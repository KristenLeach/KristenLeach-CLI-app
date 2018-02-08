#arrays of books from each category, & description?
require 'pry'
class BookwormBuddy::Book
    attr_accessor :title, :author, :price, :description, :description_url
    @@all = []

    #initialized with attribute hash 
    def initialize(bestseller_hash)
        bestseller_hash.each {|key, value| self.send("#{key}=", value)}
        @@all << self 
        #binding.pry
    end

    def self.create(book_array)
        book_array.each {|book| self.new(book)}
    end

    def self.list_books_by_category(category_number)
        @@all.each_with_index {|book, index| puts "#{index+1}. \"#{book.title}\" - by: #{book.author} - #{book.price}"} 
    end
    
    def self.add_description(description)
        @description << description
    end
end