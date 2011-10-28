# SSEDAP Client

Client gem for consuming web services exposed by [SSEDAP](/codykrieger/ssedap).

## Dependencies

Patron ([https://github.com/toland/patron](https://github.com/toland/patron))

## Usage


```ruby
require 'ssedap/client'

client = SSEDAP::Client.new "https://ssedap.local"

client.authorize user, pass
  #=> {"status"=>200, "data"=>{"success"=>true, "user"=>"cjk7752", "user_info"=>{"role"=>"Admin"}}}
```

