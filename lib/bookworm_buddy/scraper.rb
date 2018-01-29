require 'pry'
class BookwormBuddy::Scraper

    def self.list_categories
        doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?&page=1&showMoreIds=10008"))
        categories = []
            doc.css("ul#sidebar-section-0 li").collect do |link| 
            category_hash = {}
                category_hash[:name] = link.text.strip
                category_hash[:url] = link.css('a.bread-crumbs__item').attr('href').value
                categories << category_hash 
                #binding.pry
            end
        categories.slice!(-1)
        categories.each_with_index {|category, index| puts "#{index+1}. #{category[:name]}"
    end
end