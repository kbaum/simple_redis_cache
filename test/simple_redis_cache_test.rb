require File.dirname(File.expand_path(__FILE__)) + '/test_helper'

class SimpleRedisCacheTest < Test::Unit::TestCase

  include SimpleRedisCache

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    redis.flushdb
  end


  def test_expire_block
    cache('hello', :ttl=>1) { 'world' }
    sleep(2)
    assert_nil(redis['hello'])
  end

  def test_cache
    cache('hello') { 'world' }
    assert_equal(redis['hello'], 'world')
  end

  def test_cache_with_expire_block
    assert_equal('world', cache('hello', :ttl=>1000) { 'world' })
  end

  def test_block_is_only_executed_once
    @index = 0
    2.times { cache('hello') { @index+=1 } }
    assert_equal(@index, 1)
  end

  class MyClass
    include SimpleRedisCache
  end


  def test_config_singleton_redis
    shared_redis                   = Redis.new
    SimpleRedisCache::Config.redis = shared_redis
    assert_same(shared_redis.object_id, MyClass.new.redis.object_id)
  end

  def test_cache_on_module_method
    SimpleRedisCache.cache('hello') { 'world' }
    assert_equal(redis['hello'], 'world')
  end


end