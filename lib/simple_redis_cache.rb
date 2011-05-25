require 'redis'

module SimpleRedisCache

  extend self


  def redis
    Config.redis
  end

  def cache(key, opts={}, &block)
    unless (value = redis[key])
      value = redis[key] = block.call
      redis.expire(key, opts[:ttl]) if opts[:ttl]
    end
    value
  end

  module Config

    def self.redis=(redis)
      @redis = redis
    end

    def self.redis
      @redis ||= Redis.new
    end
  end

end
