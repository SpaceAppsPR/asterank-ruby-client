# asterank-ruby

A module for using the Asterank APIs. Sponsored by [Space Apps PR](http://spaceappspr.com).

The Asterank, MPC and Kepler APIs accepts queries that adhere to mongo's json format for a 'find' operation. This gem leverages mongoid's origin gem to construct these queries. 

[Asterank API](http://www.asterank.com/api "Asterank - API") [MPC API](http://www.asterank.com/mpc "MPC - API") [Kepler API](http://www.asterank.com/kepler "Kepler - API") [Skymorph API](http://www.asterank.com/skymorph "Skymorph - API").

## Install

Via rubygems.org:

```bash
gem install asterank-ruby
```

## Getting Started

### Setup Work

``` ruby

require 'asterank-ruby'

# set up a client to talk to the Asterank APIs
@client = Asterank::Client.new 
```

### Query Asterank API
http://www.asterank.com/api/asterank?query={%22e%22:{%22$lt%22:0.1},%22i%22:{%22$lt%22:4},%22a%22:{%22$lt%22:1.5}}&limit=10
``` ruby
results = @client.asterank.lt(
  e: 0.1, 
    i: 4, 
    a: 4).limit(10).execute


```

### Query MPC API

``` ruby
results = @client.mpc.lt(
  e: 0.1, 
    i: 4, 
    a: 4).limit(10).execute
```

### Query Kepler API

``` ruby
results = @client.kepler.lt(TPLANET:320).gt(TPLANET:290).limit(10).execute
```

### Query Skymorph API

``` ruby
target = "J99TS7A"
query = @client.skymorph.search(target)

result = query["results"].first
# Write Image to Disk
key = result["key"]
@client.skymorph.image(key, "filename.jpg", false) # fast image false

File.open('filename.jpg')
$ #<File:filename.jpg>
```

## More Information

These gems borrows heavily from the twilio-ruby gem in documentation and code design.