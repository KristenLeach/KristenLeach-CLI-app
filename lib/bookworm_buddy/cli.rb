class BookwormBuddy::CLI

    def call
        puts "\n""--------------------------------------------"
        puts "\n""       Welcome to the Bookworm Buddy!       "
        puts "\n""--------------------------------------------"
        puts "         .--.                   .---.     "
        puts "     .---|__|           .-.     |~~~|     "
        puts "  .--|===|--|      _    |_|     |~~~|--.  "
        puts "  |  |===|  |     / .---!~|  .--|   |--|  "
        puts "  |%%|   |  |    /  |===| |--|%%|   |  |  "
        puts "  |%%|   |  |   /.'/|   | |__|  |   |  |  "
        puts "  |  |   |  |  /  / |===| |==|  |   |  |  "
        puts "  |  |   |__| /.'/  |   |_|__|  |~~~|__|  "
        puts "  |  |===|--|/.'/   |===|~|--|%%|~~~|--|  "
        puts "  ^--^---'--^`-^    ^---^-^--^--^---'--'  "
        puts "\n""--------------------------------------------"
        puts "\n""We bring you the top 20 Barnes & Noble bestselling books in the category of your choice," "\n" "so you can spend less time searching and more time reading!"
        puts "\n""Give us one moment to start up."
        BookwormBuddy::Scraper.get_categories
        main_menu
    end

    def main_menu
        puts "\n""To see the list of book categories, enter 'list,' to exit enter 'exit.'"
        input = gets.strip
        if input == "list"
            list
        elsif input == "exit"
            exit
        else 
            "I'm not sure what you meant. To see the list of categories, enter 'list.' To exit, enter 'exit.'"
            main_menu
        end
    end

    def list
        BookwormBuddy::Category.list_categories
        puts "\n""----------------------------------------"
        puts "To see the top 20 bestsellers in a category, enter the category number below."
        puts "----------------------------------------""\n"
        bestsellers
    end

    def bestsellers
        input = gets.strip 
        if input.to_i.between?(1, 50)
            BookwormBuddy::Scraper.get_books_by_category(input)
            BookwormBuddy::Book.list_books_by_category(input)
            puts "\n""----------------------------------------"
            puts "To see the a summary of a title that interests you, enter that number below. Otherwise, enter 'menu' to return to the main menu."
            puts "----------------------------------------""\n"
            description
        elsif input == "menu" 
            main_menu
        elsif input == "exit"
            exit
        end
    end

    def description
        input = gets.strip
        if input.to_i.between?(1, 20)
            BookwormBuddy::Scraper.get_description(input)
            puts "\n""----------------------------------------"
            puts "To see another book, enter that number below. Otherwise, enter 'menu' to return to the main menu."
            puts "----------------------------------------""\n"
            description
        elsif input == "menu"
            main_menu
        elsif input == "exit" 
            exit 
        end
    end

    def exit
        puts "We hope you found what you were looking for.""\n""Happy reading!"
    end
end