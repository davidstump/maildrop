require "bundler/gem_tasks"
require 'rubygems'
require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/**/*_test*'
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r maildrop.rb"
end

desc "Run tests"
task :default => :test
