require 'redis'

module SimpleRedisCache

  def redis=(redis)
    @redis = redis
  end

  def redis
    @redis ||= Redis.new
  end

  def cache(key, opts={}, &block)
    unless redis.exists(key)
      redis[key]=block.call
      redis.expire(key, opts[:ttl]) if opts[:ttl]
    end
  end

end
