require File.dirname(File.expand_path(__FILE__)) + '/test_helper'

class SimpleRedisCacheTest < Test::Unit::TestCase

  include SimpleRedisCache

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    redis.flushdb
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_cache_object
    cache('hello', 'world')
    assert_equal(get('hello'), 'world')
  end

  def test_cache_block
    cache('hello'){ 'world' }
    assert_equal(get('hello'), 'world')
  end


end