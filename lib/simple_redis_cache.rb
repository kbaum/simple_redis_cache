require 'redis'

module SimpleRedisCache

  extend self

  def redis=(redis)
    @redis = redis
  end

  def redis
    @redis ||= Redis.new
  end

  def cache(key, opts={}, &block)
    unless (value = redis[key])
      value = redis[key] = block.call
      redis.expire(key, opts[:ttl]) if opts[:ttl]
    end
    value
  end

end
