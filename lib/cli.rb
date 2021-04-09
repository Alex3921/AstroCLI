class CLI 

    def start
        puts "Welcome to your first Astronomy class!"
        puts "What is your name?"
        greeting(user_input)
        puts "To navigate through the menus please type in the number that corresponds to your desired choice."
        puts "To end the session at any time please type 'exit'."
        puts "Now, let's learn some interesting facts about stars and planets."
    end

    def user_input
        gets.strip
    end

    def greeting(name)
        puts "#{name}, it's great to have you with us!"
    end

end

