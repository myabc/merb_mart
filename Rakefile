require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'merb-core/version'
require 'merb-core/test/tasks/spectasks'

PLUGIN = "merb_e_mart"
NAME = "merb_e_mart"
AUTHOR = "Your Name"
EMAIL = "Your Email"
HOMEPAGE = "http://merbivore.com/"
SUMMARY = "Merb Slice that provides ..."
VERSION = "0.9.4"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "GPL-LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-slices', '>= 0.9.4')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,spec,app,public}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install MerbEMart as a gem"
task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION} --no-update-sources --local}
end

namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{SUDO} jruby -S gem install pkg/#{NAME}-#{VERSION}.gem --no-rdoc --no-ri}
  end
  
end
