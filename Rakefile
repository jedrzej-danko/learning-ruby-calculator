task :test do
  ruby *%(tests.rb)
end

task :style do
  sh *%w(rubocop)
end

task :default => :test
