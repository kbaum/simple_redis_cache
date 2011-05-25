SimpleRedisCache
================

_SimpeRedisCache_ is a simple ruby module allowing for caching the result of a block in redis for a given time period.

Let's cache something for 1 minute

```ruby
    class MyClass

      include SimpleRedisCache

      REDIS = Redis.new

      def redis
        REDIS
      end

      def hello
        cache('hello', :ttl=>60){ 'world' }
      end
    end
```

Amazing!