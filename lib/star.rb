class Star
    attr_accessor :hd_name, :mst_age, :mst_mass, :mpl_pnum
    
    @@all = []

    # hd_name       - star name
    # mst_age       - star age in billion years
    # mpl_pnum      - number of planets in the planetary system
    # mst_mass      - stellar mass(amount of matter contained in the star,  
    #               - measured in units of masses of the Sun)

    # we use mass assignment for every new instance that we create
    # while also making sure that we get only the needed attributes 

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

    # obj.hd_name != nil && obj.mst_age != nil && obj.mst_mass != nil 
    # && obj.mpl_pnum != nil

end