require 'pry'
class BookwormBuddy::Scraper
    @@categories = []
    
    def self.list_categories
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?&page=1&showMoreIds=10008"))
            doc.css("ul#sidebar-section-0 li").collect do |link| 
            category_hash = {}
                category_hash[:name] = link.text.strip
                category_hash[:url] = link.css('a.bread-crumbs__item').attr('href').value
                @@categories << category_hash 
            end
        @@categories.slice!(-1)
        @@categories.each_with_index {|category, index| puts "#{index+1}. #{category[:name]}"}
        #binding.pry
    end

    def self.list_books_by_category(category_number)
        bestseller_url = @@categories[category_number.to_i - 1] && @@categories[category_number.to_i - 1][:url]
        doc = Nokogiri::HTML(open(bestseller_url))
        #must grab title, author, price & url 
    end

    def self.book_description
        #must grab short description of book
    end

end