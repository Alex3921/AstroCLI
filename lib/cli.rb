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
        main_menu
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
    end

    def planet_recent_discoveries
        results = Planet.all.sort_by{ |obj| -obj.mpl_disc}[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_earth_like_mass
        results = Planet.all.sort_by{|obj| (1-obj.mpl_masse).abs}[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_earth_like_orbit
        results = Planet.all.sort_by{|obj| (365-obj.mpl_orbper).abs}[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_find_by_name
        puts "-> Please type the planet that you want to learn about."
        selection = user_input
        results = Planet.all.find{|obj| obj.mpl_name == selection}
        planet_details(results)
    end

    def planet_random
       results = Planet.all.sample
       planet_details(results)
    end

    def planet_menu(i = "planet_menu")
        puts "1. See 5 most recent planets discovered"
        puts "2. Top 5 planets with earth-like mass"
        puts "3. Top 5 planets with earth-like orbit arround the host star"
        puts "4. Discover and learn! We'll choosed the planet"
        puts "5. Lookup planets by name"
        menu(i)
    end

    def planet_details(planet)
        puts "Name: #{planet.mpl_name}"
        puts "Host star: #{planet.mpl_hostname}"
        puts "Discovered: #{planet.mpl_disc}"
        puts "Mass(Earth mass unit): #{planet.mpl_masse}"
        puts "Orbital period(days): #{planet.mpl_orbper}"
        
    end
    
    def planet_printer(results)
        results.each.with_index(1){|obj, idx| puts "#{idx}. #{obj.mpl_name}" }
    end

    def star_by_mass
        results = Star.all.sort_by{|obj| -obj.mst_mass}[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_oldest
        results = Star.all.sort_by{|obj| -obj.mst_age}[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_find_by_name
        puts "-> Please type the planet that you want to learn about."
        selection = user_input
        results = Star.all.find{|obj| obj.hd_name == selection}
        star_details(results)
    end

    def star_random
        results = Star.all.sample
        star_details(results)
    end

    def star_planets_in_orbit
        results = Star.all.sort_by{|obj| -obj.mpl_pnum}[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_menu(i = "star_menu")
        puts "1. Top 5 heaviest stars"
        puts "2. Top 5 oldest stars"
        puts "3. Top 5 stars with the most planets orbiting arround them"
        puts "4. Discover and learn! We'll choosed the star"
        puts "5. Lookup star"
        menu(i)
    end

    def star_printer(results)
        results.each.with_index(1){|obj, idx| puts "#{idx}. #{obj.hd_name}"}
    end

    def star_details(star)
        puts "Name: #{star.hd_name}"
        puts "Age: #{star.mst_age}"
        puts "Mass(Sun mass unit): #{star.mst_mass}"
        puts "Planets in the solar system: #{star.mpl_pnum}"
    end

    def main_menu(i = "main_menu")
        puts "1. Learn about planets"
        puts "2. Learn about stars"
        menu(i)
    end

    def menu(method_identifier = "")
        
        selection = user_input

        case 
        when method_identifier == "main_menu" && selection == "1"
            planet_menu
        when method_identifier == "main_menu" && selection == "2"
            star_menu
        when method_identifier == "planet_menu" && selection == "1"
            planet_recent_discoveries
        when method_identifier == "planet_menu" && selection == "2"
            planet_earth_like_mass
        when method_identifier == "planet_menu" && selection == "3"
            planet_earth_like_orbit
        when method_identifier == "planet_menu" && selection == "4"
            planet_random
        when method_identifier == "planet_menu" && selection == "5"
            planet_find_by_name
        when method_identifier == "star_menu" && selection == "1"
            star_by_mass
        when method_identifier == "star_menu" && selection == "2"
            star_oldest
        when method_identifier == "star_menu" && selection == "3"
            star_planets_in_orbit
        when method_identifier == "star_menu" && selection == "4"
            star_random
        when method_identifier == "star_menu" && selection == "5"
            star_find_by_name
        when selection == "exit"
            goodbye
        else
            invalid
            menu(method_identifier)
        end

    end

    def submenu(obj)
        
        selection = user_input

        case 
        when (1..5).include?(selection.to_i) && obj[0].class == Planet
            planet_details(obj[selection.to_i-1])
        when (1..5).include?(selection.to_i) && obj[0].class == Star
            star_details(obj[selection.to_i-1])
        when selection == "exit"
            goodbye
        else
            invalid
            submenu(obj)
        end
    end

end

