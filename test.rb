require 'ssedap-client'

SSEDAP::Client.authorize "<ldap username>", "<ldap password>"
SSEDAP::Client.userinfo "<ldap username>", "<ldap password>", "<ldap username>"

