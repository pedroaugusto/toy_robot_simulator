# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robot_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = "toy_robot_simulator"
  spec.version       = ToyRobotSimulator::VERSION
  spec.authors       = ["Pedro Benevides"]
  spec.email         = ["pedro.augusto.sb@gmail.com"]

  spec.summary       = %q{Simple gem that simulates toy robot}
  spec.description   = %q{Simple gem that simulates toy robot}
  spec.homepage      = "git@github.com:pedroaugusto/toy_robot_simulator.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
