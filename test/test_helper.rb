dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'

require 'test/unit'
require 'rubygems'
require 'bundler'

Bundler.require

require 'simple_redis_cache'
require 'ruby-debug'