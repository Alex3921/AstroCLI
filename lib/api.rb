class API

    def self.get_data
        response = RestClient.get('https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&select=*&format=json')
        obj_list = JSON.parse(response)
    end

end