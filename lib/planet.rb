class Planet
    attr_accessor :mpl_name, :mpl_hostname, :mpl_disc, :mpl_orbper, :mpl_masse
    
    @@all = []

    # mpl_name      - planet name
    # mpl_hostname  - host star name
    # mpl_orbper    - time the planet takes to make a complete orbit around the host star or system
    # mpl_masse     - planet mass. Amount of matter contained in the planet, 
    #               - measured in units of masses of the Earth
    # mpl_disc      - year the planet was discovered

    

    def initialize(attributes)
        attributes.each do |key, value|
            self.send(("#{key}="), value) if self.respond_to?("#{key}=")
        end
        save
    end

    def self.all
        @@all
    end

    def save
        # we save the object only if it has values for each attribute

        if self.mpl_name != nil && self.mpl_hostname != nil && self.mpl_disc != nil && self.mpl_orbper != nil && self.mpl_masse != nil
            @@all << self
        end

    end

    def self.remove_duplicates
        all.uniq!{|obj| obj.mpl_name}
    end

    def self.sorted_discovery
        all.sort_by{ |obj| -obj.mpl_disc}
    end

    def self.sorted_mass
        all.sort_by{|obj| (1-obj.mpl_masse).abs}
    end

    def self.sorted_orbit_duration
        all.sort_by{|obj| (365-obj.mpl_orbper).abs}
    end

    def self.find_by_name(name)
        all.find{|obj| obj.mpl_name.downcase == name.downcase}
    end

end
