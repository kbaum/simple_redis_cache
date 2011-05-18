require File.dirname(File.expand_path(__FILE__)) + '/test_helper'

class SimpleRedisCacheTest < Test::Unit::TestCase

  include SimpleRedisCache

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    redis.flushdb
  end



  def test_expire_block
    cache('hello', :ttl=>1){ 'world' }
    sleep(2)
    assert_nil(redis['hello'])
  end

  def test_cache
    cache('hello'){ 'world' }
    assert_equal(redis['hello'], 'world')
  end

  def test_block_is_only_executed_once
    @index = 0
    2.times{ cache('hello'){ @index+=1 } }
    assert_equal(@index, 1)
  end


end