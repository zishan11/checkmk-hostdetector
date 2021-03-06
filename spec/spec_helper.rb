# -*- coding: utf-8; -*-
# frozen_string_literal: true
# vim:set fileencoding=utf-8:

begin
  require 'simplecov'
rescue LoadError
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def require_all_lib_files
  libdir = File.realpath(File.join(__dir__, '..', 'lib'))
  libs   = Dir.glob(File.join(libdir, '**', '*.rb'))

  libs.each do |lib|
    require lib
  end
end

require_all_lib_files
