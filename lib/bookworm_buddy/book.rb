class BookwormBuddy::Book
    attr_accessor :title, :author, :price, :description, :description_url
    ALL = []

    def initialize(bestseller_hash)
        bestseller_hash.each {|key, value| self.send("#{key}=", value)}
        ALL << self 
    end

    def self.create(book_array)
        book_array.each {|book| self.new(book)}
    end

    def self.list_books_by_category(category_number)
        puts BookwormBuddy::Category::ALL[category_number.to_i - 1].name.colorize(:magenta)
        ALL.each_with_index {|book, index| puts "#{index+1}. \"#{book.title}\" - by: #{book.author} - #{book.price}"}
    end
    
    def self.list_title(book)
        puts "'#{book.title}'".colorize(:magenta)
    end 

    def self.list_description(description)
        puts "#{description}"
    end

    def self.empty
        ALL.clear
    end
end