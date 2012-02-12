require 'rake'
require 'rake/testtask'
require 'rdoc/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "first-floor"
    s.summary = %Q{A little bit above ActionController::Base}
    s.email = "nathan@wallscorp.us"
    s.homepage = "http://github.com/base10/first-floor"
    s.description = %Q{Takes care of the basic seven CRUD controller methods against HTML, XML, JSON and YAML. This was very useful with Rails 2.x. Under Rails 3 and later, this isn't quite as necessary, since rendering became a lot easier.}
    s.authors = ["Nathan L. Walls"]
    s.license = 'MIT'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'first-floor'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Rcov::RcovTask.new do |t|
#   t.libs << 'test'
#   t.test_files = FileList['test/**/*_test.rb']
#   t.verbose = true
# end

#task :default => :rcov
