class Planet
    attr_accessor :mpl_name, :mpl_hostname, :mpl_disc, :mpl_trandur, :mpl_masse
    
    @@all = []

    # mpl_name      - planet name
    # mpl_hostname  - host star name
    # mpl_trandur   - orbital period(days)
    # mpl_masse     - planet mass. Amount of matter contained in the planet, 
    #               - measured in units of masses of the Earth
    # mpl_disc      - year the planet was discovered

    # we use mass assignment for every new instance that we create

    def initialize(attributes)
        attributes.each do |key, value|
            if self.respond_to?("#{key}=")
                self.send(("#{key}="), value)
            end
        end
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    # obj.mpl_name != nil && obj.mpl_hostname != nil && obj.mpl_disc != nil 
    # && obj.mpl_trandur != nil && obj.mpl_masse != nil
end
