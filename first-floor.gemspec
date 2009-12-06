# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{first-floor}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan L. Walls"]
  s.date = %q{2009-02-22}
  s.description = %q{A gem to DRY out controller code. It lives just a bit above 'ActionController::Base'}
  s.email = %q{nathan@rexluther.com}
  s.files = ["VERSION.yml", "lib/action_controller", "lib/action_controller/first_floor.rb", "test/first_floor_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/base10/first-floor}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A little bit above ActionController::Base}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
