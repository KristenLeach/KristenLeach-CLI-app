require 'pry'
class BookwormBuddy::Scraper
    attr_accessor :category
    @@categories = []
    @@bestsellers = []
    
    def self.list_categories
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?&page=1&showMoreIds=10008"))
            doc.css("ul#sidebar-section-0 li").collect do |link| 
            category_hash = {}
                category_hash[:name] = link.text.strip
                category_hash[:url] = "https://www.barnesandnoble.com#{link.css('a.bread-crumbs__item').attr('href').value}"
                @@categories << category_hash 
            end
            @@categories.slice!(-1)
            BookwormBuddy::Category.create(@@categories)
        #list_books_by_category("7")
    end

    def self.list_books_by_category(category_number)
        bestseller_url = @@categories[category_number.to_i - 1] && @@categories[category_number.to_i - 1][:url]
        doc = Nokogiri::HTML(open(bestseller_url))
        
            doc.css('div.col-lg-8.product-info-listView').each do |book|
                attributes_hash = {}
                attributes_hash[:title] = book.css('h3.product-info-title a').text
                attributes_hash[:author] = book.css('div.product-shelf-author.contributors a').first.text
                attributes_hash[:price] = book.css("span.current a").first.text
                attributes_hash[:description_url] = "https://www.barnesandnoble.com#{book.css('h3.product-info-title a').attr('href').value}"
                @@bestsellers << attributes_hash
            end
       @@bestsellers.each_with_index {|book, index| puts "#{index+1}. #{book[:title]} - by: #{book[:author]} - #{book[:price]}"} 
       book_description('4')
    end

    def self.book_description(book_number)
        description_link = @@bestsellers[book_number.to_i - 1][:description_url]
        doc = Nokogiri::HTML(open(description_link))
            doc.css("div#Overview").each do |info|
                description = info.css('div#productInfoOverview p').text
                binding.pry
    end
    end

end