# encoding: utf-8 
#
require 'rake'
require 'rdoc/task'

begin
  require 'jeweler'

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'well-formed-html'
    gemspec.summary = 'a rack middleware that informs you on the well-formedness of the responses'
    gemspec.description = 'this rails3 middleware uses nokogiri to parse the body of' \
                          'the apps html response and checks if it is well-formed ' \
                          'it can be configured to repair errors, but the default behaviour is ' \
                          'to print errors and warnings in order to repair the tamplates that  ' \
                          'produce the html response. Therefore it is on by default only in development.'
    gemspec.authors = ['Christian Woerner']
    gemspec.homepage = 'http://github.com/kr1/well_formed_html_middleware'
    gemspec.email = 'krist_bombay@hotmail.com'
    gemspec.add_dependency('nokogiri')
  end
rescue LoadError
  puts 'Jeweler not available. Install it with: gem install jeweler'
end

desc 'Generate the rdoc'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_files.add %w( README.md lib/**/*.rb )

  rdoc.main  = 'README.md'
  rdoc.title = 'Well-formedness checker Middleware'
end
