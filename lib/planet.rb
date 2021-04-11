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
        # we use mass assignment for every new instance that we create

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

end
