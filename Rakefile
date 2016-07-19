# frozen_string_literal: true
require 'cucumber'
require 'rubygems'
require 'cucumber/rake/task'
require 'yaml'
require 'watir-webdriver'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rake'
gem 'ci_reporter'

def exclude_inactive_tags
  '--tags ~@wip'
end

# Cucumber::Rake::Task.new(:default, 'All completed features') do |t|
#   t.cucumber_opts = exclude_inactive_tags
#   t.profile = 'html_report'
# end
#
# Cucumber::Rake::Task.new(:example, 'Example features') do |t|
#   t.cucumber_opts = exclude_inactive_tags
#   t.profile = 'example'
# end

Rake::TestTask.new(:unit_tests) do |t|
  t.warning = false
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

RSpec::Core::RakeTask.new(:specs) do |t|
  t.exclude_pattern = 'spec/*_spec.rb'
end

RSpec::Core::RakeTask.new(:integration) do |t|
  t.pattern = 'spec/integration_tests/*_spec.rb'
end

task :ci_cleanup do
  require 'minitest/ci'
  Minitest::Ci.new.start
end
task :test => %w[ci_cleanup unit_tests]
