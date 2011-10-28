require "ssedap-client/version"
require "patron"

module SSEDAP
  module Client
    def self.authorize(username, password)
      # code...

      information = Hash.new
      sess = Patron::Session.new

      sess.timeout = 10
      sess.base_url = "http://localhost:3000"
      sess.headers['User-Agent'] = 'ssedap/1.0'
      info = sess.post("/api/authorize", "username=#{username}&password=#{password}")

      information["status"] = info.status
      information["info"] = info.body
      #puts info.status
      #puts info.body

      return information
    end

    def self.userinfo(username, password, lookup)
      # code...
      
      information = Hash.new
      sess = Patron::Session.new
      
      sess.timeout = 10
      sess.base_url = "http://localhost:3000"
      sess.headers['User-Agent'] = 'ssedap/1.0'
      info = sess.post("/api/userinfo", 
                       "username=#{username}&password=#{password}&lookup=#{lookup}")
      
      information["status"] = info.status
      information["info"] = info.body
      #puts info.status
      #puts info.body

      return information
    end
  end
end
