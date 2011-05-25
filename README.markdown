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

The above uses the default _Redis.new_ instance running on _127.0.0.1:6379_

Let's configure a different redis instance.

```ruby
  SimpleRedisCache::Config.redis =  Redis.new(:host => "10.0.1.1", :port => 6380)
```

My benchmarks show this is faster than your current cache.


But why would I use this?
________________________

Because you already depend on redis through _Resque_.



