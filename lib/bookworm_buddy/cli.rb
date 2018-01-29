class BookwormBuddy::CLI

    def call
        list
    end

    def list
        BookwormBuddy::Scraper.list_categories
    end
end