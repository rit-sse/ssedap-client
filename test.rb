require 'ssedap/client'

host = "http://ssedap.dev"
user = ""
pass = ""
lookup = ""

puts <<-EOF
################
SSEDAP Tester
################

EOF

printf "Host [#{host}]: "
input = gets.chomp
host = input.empty? ? host : input

printf "Authenticating user: "
user = gets.chomp

printf "Password: "
pass = gets.chomp

printf "User to look up: "
lookup = gets.chomp

puts "\nTesting API methods..."
puts

client = SSEDAP::Client.new host
puts client.authorize user, pass
puts client.userinfo user, pass, lookup

