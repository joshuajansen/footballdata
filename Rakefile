require 'rake/testtask'
require 'dotenv'

Dotenv.load

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test
