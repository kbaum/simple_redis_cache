require 'redis'

module SimpleRedisCache

  def redis=(redis)
    @redis = redis
  end

  def redis
    @redis ||= Redis.new
  end

  def cache(*args, &block)
    redis[args.first]=(block ? block.call : args.last)
  end

  def get(key)
    redis[key]
  end



end
