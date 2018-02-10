class BookwormBuddy::CLI

    def call
        puts "\n""--------------------------------------------".colorize(:cyan)
        puts "\n""       Welcome to the Bookworm Buddy!       ".colorize(:green)
        puts "\n""--------------------------------------------".colorize(:cyan)
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
        puts "\n""We bring you the top 20 Barnes & Noble bestselling books in the category of your choice," "\n" "so you can spend less time searching and more time reading!".colorize(:green)
        puts "\n""Give us one moment to awaken the book gnomes.".colorize(:magenta)
        BookwormBuddy::Scraper.get_categories
        main_menu
    end

    def main_menu
        puts "\n""To see the list of book categories, enter 'list,' to exit enter 'exit.'".colorize(:green)
        input = gets.strip
        if input == "list"
            list
        elsif input == "exit"
            exit
        else 
            puts "\n"".... I am not sure what you meant (neither are the gnomes). Try again?".colorize(:red)
            main_menu
        end
    end

    def list
        BookwormBuddy::Category.list_categories
        puts "\n""----------------------------------------".colorize(:cyan)
        puts "\n""To see the top 20 bestsellers in a category, enter the category number below.".colorize(:green)
        puts "\n""----------------------------------------""\n".colorize(:cyan)
        bestsellers
    end

    def bestsellers
        input = gets.strip 
        if input.to_i.between?(1, 50)
            BookwormBuddy::Scraper.get_books_by_category(input)
            BookwormBuddy::Book.list_books_by_category(input)
            puts "\n""----------------------------------------".colorize(:cyan)
            puts "\n""To see the summary of a title that interests you, enter that number below. Otherwise, enter 'list' to return to the list of categories, or 'exit' to exit.".colorize(:green)
            puts "\n""----------------------------------------""\n".colorize(:cyan)
            description
        elsif input == "list" 
            list
        elsif input == "exit"
            exit
        else 
            puts "\n"".... I am not sure what you meant (neither are the gnomes). Try again?".colorize(:red)
            bestsellers
        end
    end

    def description
        input = gets.strip
        if input.to_i.between?(1, 20)
            BookwormBuddy::Scraper.get_description(input)
            puts "\n""----------------------------------------".colorize(:cyan)
            puts "\n""To see another book, enter that number below. Otherwise, enter 'list' to return to the list of categories, or 'exit' to exit.".colorize(:green)
            puts "\n""----------------------------------------""\n".colorize(:cyan)
            description
        elsif input == "list"
            list
        elsif input == "exit" 
            exit 
        else 
            puts ".... I am not sure what you meant (neither are the gnomes). Try again?".colorize(:red)
            description
        end
    end

    def exit
        puts "We hope you found what you were looking for.".colorize(:yellow)
        puts "\n""       ,   ,    "
        puts "      /////|    "
        puts "     ///// |    "
        puts "    |~~~|  |    "
        puts "    |===|  |    "
        puts "    |b  |  |    "
        puts "    | y |  |    "
        puts "    |  e| /     "
        puts "    |===|/      "
        puts "    '---'       "
        puts "\n""Happy reading!".colorize(:yellow)
    end
end