require 'bundler'
Bundler::GemHelper.install_tasks

require File.dirname(__FILE__) + '/lib/simple_redis_cache'

require 'rake/testtask'

Rake::TestTask.new do |t|
    t.pattern = "test/*_test.rb"
end

