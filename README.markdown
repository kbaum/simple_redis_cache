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

The above uses the default _Redis.new_ instance running on _127.0.0.1:6379_

Let's configure a different redis instance.

```ruby
  SimpleRedisCache::Config.redis =  Redis.new(:host => "10.0.1.1", :port => 6380)
```

Call it as a method on the module.

```ruby
    SimpleRedisCache.cache('hello') { 'world' }
```