# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_redis_cache/version"

Gem::Specification.new do |s|
  s.name        = "simple_redis_cache"
  s.version     = SimpleRedisCache::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kbaum"]
  s.email       = ["karl.baum@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{simple api for caching strings in redis and passing a time to live}
  s.description = %q{simple api for caching strings in redis and passing a time to live}

  s.rubyforge_project = "simple_redis_cache"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency('redis')
  s.add_development_dependency('ruby-debug19')
end
