class API

    def self.get_data
        response = RestClient.get('https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exomultpars&select=mpl_name,mpl_hostname,mpl_disc,mpl_masse,mpl_trandur,hd_name,mst_age,mpl_pnum,mst_mass&format=json')
        obj_list = JSON.parse(response)
    end

    def self.create_objects
        API.get_data.each do |obj|
            Planet.new(obj)
            Star.new(obj)
        end
    end

end