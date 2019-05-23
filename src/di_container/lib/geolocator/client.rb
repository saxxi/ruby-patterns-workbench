class Geolocator
  class Client

    def geolocate_ip(ip)
      result = client.get("/#{ip}", params: base_params)        # net call
      {
        city: result.body['city'],                              # immediately just map values, no further logic
        region: result.body['region_name'],
        country_code: result.body['country_code'],
      }
    end

    def client
      WebREST::HTTPClient.new(url: 'http://Settings.ipstack.url') # settings
    end

    def base_params
      { access_key: 'Settings.ipstack.access_key' }               # settings
    end

  end
end
