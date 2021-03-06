class BookwormBuddy::Scraper
    attr_accessor :category
    @@categories = []
    @@bestsellers = []
    
    def self.get_categories
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?&page=1&showMoreIds=10008"))
            doc.css("ul#sidebar-section-0 li").collect do |link| 
            category_hash = {}
                category_hash[:name] = link.text.strip
                category_hash[:url] = "https://www.barnesandnoble.com#{link.css('a.bread-crumbs__item').attr('href').value}"
                @@categories << category_hash 
            end
            @@categories.slice!(-1)
            BookwormBuddy::Category.create(@@categories)   
    end

    def self.get_books_by_category(category_number)
        @@bestsellers.clear
        BookwormBuddy::Book.empty
        bestseller_url = @@categories[category_number.to_i - 1][:url]
        doc = Nokogiri::HTML(open(bestseller_url))
        #binding.pry
            doc.css('div.col-lg-8.product-info-listView').each do |book|
                attributes_hash = {}
                attributes_hash[:title] = book.css('h3.product-info-title a').text
                attributes_hash[:author] = book.css('div.product-shelf-author.contributors a').first.text
                attributes_hash[:price] = book.css("span.current a").first.text
                attributes_hash[:description_url] = "https://www.barnesandnoble.com#{book.css('h3.product-info-title a').attr('href').value}"
                attributes_hash[:description] = nil
                @@bestsellers << attributes_hash
            end
       BookwormBuddy::Book.create(@@bestsellers)
    end

    def self.get_description(book_number)
        book = BookwormBuddy::Book::ALL[book_number.to_i - 1]
        description_link = book.description_url
        doc = Nokogiri::HTML(open(description_link))
             description = doc.css("div#Overview div#productInfoOverview p").text
             book.description = description 
             BookwormBuddy::Book.list_title(book)
             BookwormBuddy::Book.list_description(book.description)
    end
   
end