require 'patron'

module SSEDAP
  class Client
    @host = "https://ssedap.se.rit.edu"

    def initialize(host=nil)
      @host = host unless host.nil?
    end

    def authorize(username, password)
      ps = session

      # url encode parameters
      username = CGI::unescape username
      password = CGI::unescape password

      # make the request
      resp = ps.post("/api/authorize", "username=#{username}&password=#{password}")

      retval = {}
      retval["status"] = resp.status
      retval["data"] = resp.body

      retval
    end

    def userinfo(username, password, lookup)
      ps = session

      # url encode parameters
      username = CGI::unescape username
      password = CGI::unescape password
      lookup = CGI::unescape lookup

      # make the request
      resp = ps.post("/api/userinfo", "username=#{username}&password=#{password}&lookup=#{lookup}")

      retval = {}
      retval["status"] = resp.status
      retval["data"] = resp.body

      retval
    end

    private

    def session
      ps = Patron::Session.new
      ps.timeout = 10
      ps.base_url = @host
      ps.headers['User-Agent'] = 'ssedap/1.0'

      ps
    end
  end
end
