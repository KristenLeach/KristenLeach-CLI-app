class BookwormBuddy::CLI

    def call
        puts "Welcome to the Bookworm Buddy!"
        puts "\n""We bring you the top 20 Barnes & Noble bestselling books in the category of your choice, so you'll have fresh material in no time!"
        puts "\n""To see the list of categories, enter 'list'."
        input
    end

    def input
        input = gets.strip
        if input != input.to_i
            case input 
            when "list"
                list
            when "exit"
                exit
            end
        elsif input.to_i.between?(1, 50)
            bestsellers
        else 
            "I'm not sure what you meant. Please try again."
            input
        end
    end

    def list
        categories = BookwormBuddy::Scraper.get_categories
        BookwormBuddy::Category.create(categories)
        
        puts "----------------------------------------"
        puts "To see the top 20 bestsellers in a category, enter the category number below."
        puts "----------------------------------------"
        input
        #bestsellers
    end

    def bestsellers
        #input = gets.to_i
        #if input.between?(1, 50)
            puts "this is working"
       # else 
           # puts "... I am not sure what you meant. Please try again."
        #end
    end

    def exit
        puts "We hope you found what you were looking for!"
        puts "Happy reading."
    end
end