$:.push File.expand_path("../lib", __FILE__)

require 'salary/version'
VERSION = Salary::Version

Gem::Specification.new do |s|
  s.name        = 'salary'
  s.version     = VERSION
  s.date        = '2016-09-28'
  s.summary     = "salary"
  s.description = "A simple salary managemant system"
  s.authors     = ["zoqilin"]
  s.email       = 'zouqilin@csu.edu.cn'
  s.files       = ["lib/**/*.rb"]
  s.homepage    = 'http://github.com/zouqilin/salary'
end
