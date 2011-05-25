SimpleRedisCache
================

Easily cache the result of a block within redis for a given time period.

Let's cache something for 1 minute

```ruby
    class MyClass

      include SimpleRedisCache

      def hello
        cache('hello', :ttl=>60){ 'world' }
      end
    end
```

Call it straight from the module instead and this time cache it forever.

```ruby
    SimpleRedisCache.cache('hello') { 'world' }
```

Maybe we should cache something worth while.  If the result of the block is not a string, make sure to convert it to one.

```ruby
  require 'json'

  JSON.parse(cache('20_perm_4', :ttl=>120){ (0..20).to_a.permutation(4).to_a.to_json })
```

Notice we serialize to json inside the block and from json outside the block.  Of course converting an enormous array
to and from JSON is slower than the permutation so maybe it's not the best example.  Replace the above with an expensive
databse calculation and it makes more sense.


The above uses the default _Redis.new_ instance running on _127.0.0.1:6379_

Let's configure a different redis instance.

```ruby
  SimpleRedisCache::Config.redis =  Redis.new(:host => "10.0.1.1", :port => 6380)
```

My benchmarks show this is faster than your current cache.


But why would I use this?
------------------------
Because you already depend on redis through _Resque_.



