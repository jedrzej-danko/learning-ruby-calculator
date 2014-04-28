require 'rake/testtask'
Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test*.rb']
end


task :style do
  sh *%w(rubocop)
end

task :default => :test
