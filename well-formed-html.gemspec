# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{well-formed-html}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christian Woerner"]
  s.date = %q{2012-03-08}
  s.description = %q{this rails3 middleware uses nokogiri to parse the body of the app's html response and checks if it is well-formed it can be configured to repair errors, but the default behaviour is to log errors and warnings in order to repair the templates that produce the html response. Therefore it parses the response by default only in development.}
  s.email = %q{krist_bombay@hotmail.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/well_formed_html/log.rb",
    "lib/well_formed_html/middleware.rb",
    "well-formed-html.gemspec"
  ]
  s.homepage = %q{http://github.com/kr1/well_formed_html_checker_middleware}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{a rack middleware that informs you on the well-formedness of the responses}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end

