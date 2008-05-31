require 'rake/gempackagetask'
require 'spec/rake/spectask'
require 'merb-core/version'
require 'merb-core/test/tasks/spectasks'

spec = Gem::Specification.new do |s|
  s.name              = 'merb_e_mart'
  s.version           = '0.0.1'
  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README.markdown", "GPL-LICENSE", 'TODO']
  s.summary           = 'An open-source e-commerce engine slice for the Merb framework'
  s.description       = s.summary
  s.author            = 'Alex Coles'
  s.email             = 'alex@alexcolesportfolio.com'
  s.homepage          = 'http://github.com/myabc/merb_mart/tree/master'
  s.require_path      = 'lib'
  s.files             = %w(GPL-LICENSE README.markdown Rakefile TODO) + Dir.glob("{lib,spec,app,public}/**/*")
  s.add_dependency('merb-slices', '>= 0.9.4')
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
