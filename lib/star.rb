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
            self.send(("#{key}="), value) if self.respond_to?("#{key}=")
        end
        save
    end

    def self.all
        @@all
    end

    def save
        if self.hd_name != nil && self.mst_age != nil && self.mst_mass != nil && self.mpl_pnum != nil
            @@all << self 
        end
    end

    def self.remove_duplicates
        all.uniq!{|obj| obj.hd_name}
    end

    def self.sorted_mass
        all.sort_by{|obj| -obj.mst_mass}
    end

    def self.sorted_age
        all.sort_by{|obj| -obj.mst_age}
    end

    def self.find_by_name(name)
        all.find{|obj| obj.hd_name.downcase == name.downcase}
    end

    def self.planets_in_orbit 
        all.sort_by{|obj| -obj.mpl_pnum}
    end

end