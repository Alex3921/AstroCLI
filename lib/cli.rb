class CLI 

    def start
        welcome
        API.create_objects
        main_menu
    end

    def user_input
        gets.strip
    end

    def welcome
        puts ""
        puts "-> Welcome to your first Astronomy class!"
        puts "-> What is your name?"
        greeting(user_input)
        sleep(1)
        puts "-> Now, let's learn some interesting facts about stars and planets."
        sleep(2)
        puts ""
        puts "                                  ###                                  "
        puts "-> To navigate through the menu please type in the number that corresponds to your desired choice."
        puts "-> To end the session at any time please type EXIT."
        puts "                                  ###                                  "
    end

    def greeting(name)
        puts ""
        puts "-> #{name}, it's great to have you with us!"
        puts ""
    end

    def goodbye
        begin
            exit
        rescue SystemExit
            puts ""
            puts "-> Thanks for stopping by. See you next time!"
        end 
    end

    def invalid
        puts "-> Oops! That doesn't seem right, try again!"
    end

    def planet_recent_discoveries
        results = Planet.sorted_discovery[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_earth_like_mass
        results = Planet.sorted_mass[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_earth_like_orbit
        results = Planet.sorted_orbit_duration[0..4]
        planet_printer(results)
        submenu(results)
    end

    def planet_find_by_name
        puts ""
        puts "-> Please type the planet name you want to learn more about."
        puts ""
        selection = user_input
        results = Planet.find_by_name(selection)

        if results != nil
            planet_details(results)
        elsif selection.downcase == "exit"
            goodbye
        else
            invalid
            planet_find_by_name
        end
    end

    def planet_random
       results = Planet.all.sample
       planet_details(results)
    end

    def planet_menu
        puts ""
        puts "1. See 5 most recent planets discovered"
        puts "2. Top 5 planets with earth-like mass"
        puts "3. Top 5 planets with earth-like orbit arround the host star"
        puts "4. Discover and learn! We'll choose the planet"
        puts "5. Lookup planets by name"
        puts ""
        select_planet_menu
    end

    def planet_details(planet)
        puts ""
        puts "----------------------"
        puts "Name: #{planet.mpl_name}"
        puts "Host star: #{planet.mpl_hostname}"
        puts "Discovered: #{planet.mpl_disc}"
        puts "Mass(Earth mass unit): #{planet.mpl_masse.round(3)}"
        puts "Orbital period(days): #{planet.mpl_orbper.round(3)}"
        puts "----------------------"
        puts ""
        next_move(planet)
    end
    
    def planet_printer(results)
        puts ""
        puts "Enter a number for the planet you want to learn more about:"
        puts ""
        results.each.with_index(1){|obj, idx| puts "#{idx}. #{obj.mpl_name}" }
        puts ""
    end

    def select_planet_menu

        selection = user_input.downcase

        case selection
        when "1"
            planet_recent_discoveries
        when "2"
            planet_earth_like_mass
        when "3"
            planet_earth_like_orbit
        when "4"
            planet_random
        when "5"
            planet_find_by_name
        when "back"
            main_menu
        when "exit"
            goodbye
        else
            invalid
            select_planet_menu
        end
    end

    def next_move(obj)
        puts "What do you wanna do next? Type your choice .."
        puts "-> back".center(20)
        puts "-> main menu".center(24)
        puts "-> exit".center(20)
        puts ""
        select_next_move(obj)
    end

    def star_mass
        results = Star.sorted_mass[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_oldest
        results = Star.sorted_age[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_find_by_name
        puts ""
        puts "-> Please type the star name you want to learn more about."
        puts ""
        selection = user_input
        results = Star.find_by_name(selection)

        case 
        when results != nil
            star_details(results)
        when selection.downcase == "exit"
            goodbye
        else
            invalid
            star_find_by_name
        end
    end

    def star_random
        results = Star.all.sample
        star_details(results)
    end

    def star_planets_in_orbit
        results = Star.planets_in_orbit[0..4]
        star_printer(results)
        submenu(results)
    end

    def star_menu
        puts ""
        puts "1. Top 5 heaviest stars"
        puts "2. Top 5 oldest stars"
        puts "3. Top 5 stars with the most planets orbiting arround them"
        puts "4. Discover and learn! We'll choose the star"
        puts "5. Lookup star"
        puts ""
        select_star_menu
    end

    def select_star_menu

        selection = user_input.downcase

        case selection
        when "1"
            star_mass
        when "2"
            star_oldest
        when "3"
            star_planets_in_orbit
        when "4"
            star_random
        when "5"
            star_find_by_name
        when "back"
            main_menu
        when "exit"
            goodbye
        else
            invalid
            select_star_menu
        end
    end

    def star_printer(results)
        puts ""
        puts "Enter a number for the star you want to learn more about:"
        puts ""
        results.each.with_index(1){|obj, idx| puts "#{idx}. #{obj.hd_name}"}
        puts ""
    end

    def star_details(star)
        puts ""
        puts "----------------------"
        puts "Name: #{star.hd_name}"
        puts "Age(billion years): #{star.mst_age.round(3)}"
        puts "Mass(Sun mass unit): #{star.mst_mass.round(3)}"
        puts "Planets in the solar system: #{star.mpl_pnum}"
        puts "----------------------"
        puts ""
        next_move(star)
    end

    def main_menu
        puts ""
        puts "1. Learn about planets"
        puts "2. Learn about stars"
        puts ""
        select_main_menu
    end

    def select_main_menu

        selection = user_input.downcase

        case selection
        when "1"
            planet_menu
        when "2"
            star_menu
        when "exit"
            goodbye
        else
            invalid
            select_main_menu
        end
    end

    def select_next_move(obj)

        selection = user_input.downcase.split.join("")

        case 
        when selection == "mainmenu"
            main_menu
        when selection == "back" && obj.class == Planet
            planet_menu
        when selection == "back" && obj.class == Star
            star_menu
        when selection == "exit"
            goodbye
        else
            invalid
            select_next_move(obj)
        end
    end

    def submenu(obj)
        
        selection = user_input

        case 
        when (1..5).include?(selection.to_i) && obj[0].class == Planet
            planet_details(obj[selection.to_i-1])
        when (1..5).include?(selection.to_i) && obj[0].class == Star
            star_details(obj[selection.to_i-1])
        when selection.downcase == "exit"
            goodbye
        else
            invalid
            submenu(obj)
        end
    end

end

