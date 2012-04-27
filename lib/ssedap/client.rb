require 'patron'
require 'json'

module SSEDAP
  class Client
    @host = "https://ssedap"

    def initialize(host=nil)
      @host = host unless host.nil?
    end

    def create_anon(username, password)
      api_cal "/api/create_anon", username: username, password: password
    end

    def authorize(username, password)
      api_call "/api/authorize", username: username, password: password
    end

    def userinfo(username, password, lookup)
      api_call "/api/userinfo", username: username, password: password, lookup: lookup
    end

    private

    def api_call(path, *args)
      if args.first.is_a? Hash
        options = args.first
      end

      data = options.map { |k, v| "#{k}=#{CGI::escape v}" }

      ps = session
      resp = ps.post path, data.join('&')

      retval = {}
      retval["status"] = resp.status
      retval["data"] = JSON.parse resp.body

      retval
    end

    def session
      ps = Patron::Session.new
      ps.timeout = 10
      ps.base_url = @host
      ps.headers['User-Agent'] = 'ssedap/1.0'
      ps.insecure = true # this is decidedly not a best practice

      ps
    end
  end
end

