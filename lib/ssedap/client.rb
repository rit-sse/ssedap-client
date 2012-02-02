require 'patron'
require 'json'

module SSEDAP
  class Client
    @host = "https://ssedap"

    def initialize(host=nil)
      @host = host unless host.nil?
    end

    def authorize(username, password)
      ps = session

      # url encode parameters
      username = CGI::escape username
      password = CGI::escape password

      # make the request
      resp = ps.post("/api/authorize", "username=#{username}&password=#{password}")

      retval = {}
      retval["status"] = resp.status
      retval["data"] = JSON.parse resp.body

      retval
    end

    def userinfo(username, password, lookup)
      ps = session

      # url encode parameters
      username = CGI::escape username
      password = CGI::escape password
      lookup = CGI::escape lookup

      # make the request
      resp = ps.post("/api/userinfo", "username=#{username}&password=#{password}&lookup=#{lookup}")

      retval = {}
      retval["status"] = resp.status
      retval["data"] = JSON.parse resp.body

      retval
    end

    private

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

