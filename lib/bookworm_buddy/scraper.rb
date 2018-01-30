require 'pry'
class BookwormBuddy::Scraper
    @@categories = []
    
    def self.list_categories
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?&page=1&showMoreIds=10008"))
            doc.css("ul#sidebar-section-0 li").collect do |link| 
            category_hash = {}
                category_hash[:name] = link.text.strip
                category_hash[:url] = "https://www.barnesandnoble.com#{link.css('a.bread-crumbs__item').attr('href').value}"
                @@categories << category_hash 
            end
        @@categories.slice!(-1)
        @@categories.each_with_index {|category, index| puts "#{index+1}. #{category[:name]}"}
        list_books_by_category("4")
    end

    def self.list_books_by_category(category_number = "1")
        bestseller_url = @@categories["1".to_i - 1] && @@categories["1".to_i - 1][:url]
        doc = Nokogiri::HTML(open(bestseller_url))
            doc.css('div.col-lg-8.product-info-listView').each do |book|
            attributes_hash = {}
                attributes_hash[:title] = book.css('h3.product-info-title a').text
                attributes_hash[:author] = book.css('div.product-shelf-author.contributors a').first.text
                attributes_hash[:price] = book.css("span.current a").text
                attributes_hash[:description_url] = "https://www.barnesandnoble.com#{book.css('h3.product-info-title a').attr('href').value}"
            end
        #must grab title, author, price & url 
    end

    def self.book_description
        #must grab short description of book
    end

end