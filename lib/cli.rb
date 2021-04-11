class CLI 

    def start
        puts "-> Welcome to your first Astronomy class!"
        puts "-> What is your name?"
        greeting(user_input)
        sleep(3)
        puts "-> Now, let's learn some interesting facts about stars and planets."
        sleep(4)
        puts ""
        puts "                                  ###                                  "
        puts "-> To navigate through the menu please type in the number that corresponds to your desired choice."
        puts "-> To end the session at any time please type 'exit'."
        puts "                                  ###                                  "
        API.create_objects
        binding.pry
        menu
    end

    # obtain user input
    def user_input
        gets.strip
    end

    # greet the user by name
    def greeting(name)
        puts "-> #{name}, it's great to have you with us!"
    end

    # exits the app and puts out a statement
    def goodbye
        begin
            exit
        rescue SystemExit
            puts "-> Thanks for stopping by. See you next time!"
        end 
    end

    # handles an invalid input
    def invalid
        puts "-> Oops! That doesn't seem right, try again!"
        menu
    end

    def planet_recent_discoveries
        Planet.all.sort_by{ |obj| -obj.mpl_disc}[0..4]
    end

    def planet_earth_like_mass
        Planet.all.sort_by{|obj| (1-obj.mpl_masse).abs}[0..4]
    end

    def planet_earth_like_orbit
        Planet.all.sort_by{|obj| (365-obj.mpl_orbper).abs}[0..4]
    end

    def planet_find_by_name(planet_name)
        Planet.all.find{|obj| obj.mpl_name == planet_name}
    end

    def planet_random
        Planet.all.sample
    end

    def planet_menu
        puts "1. See 5 most recent planets discovered."
        puts "2. Top 5 planets with earth-like mass."
        puts "3. Top 5 planets with earth-like orbit arround the host star."
        puts "4. Discover and learn about a planet."
    end

    def planet_details(planet)
        puts "Name: #{planet.mpl_name}"
        puts "Host star: #{planet.mpl_hostname}"
        puts "Discovered: #{planet.mpl_disc}"
        puts "Mass(Earth mass unit): #{planet.mpl_masse}"
        puts "Orbital period(days): #{planet.mpl_orbper}"
        user_input
    end

    def star_by_mass
        Star.all.sort_by{|obj| -obj.mst_mass}[0..4]
    end

    def star_youngest
        Star.all.sort_by{|obj| obj.mst_age}[0..4]
    end

    def star_oldest
        Star.all.sort_by{|obj| -obj.mst_age}[0..4]
    end

    def star_find_by_name(star_name)
        Star.all.find{|obj| obj.hd_name == star_name}
    end

    def star_random
        Star.all.sample
    end

    def star_planets
        Star.all.sort_by{|obj| -obj.mpl_pnum}[0..4]
    end

    def star_details(star)
        puts "Name: #{star.hd_name}"
        puts "Age: #{star.mst_age}"
        puts "Mass(Sun mass unit): #{star.mst_mass}"
        puts "Planets in the solar system: #{star.mpl_pnum}"
    end

    def star_menu

    end

    def main_menu
        
        selection = user_input

        # case selection
        if selection == "exit" || selection == "'exit'"
            # Give the user a goodbye message and end the program
            goodbye
        elsif selection == "y"
            puts "yes"
        end
    end


end

