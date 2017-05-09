require 'rake'
require 'parallel'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:smoke_stage) do |t|
  ENV['CONFIG_NAME'] ||= "stage"
  t.pattern = Dir.glob('spec/smokes/*.smoke.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

task :default => :smoke_stage

RSpec::Core::RakeTask.new(:smoke_prod) do |t|
  ENV['CONFIG_NAME'] ||= "prod"
  t.pattern = Dir.glob('spec/smokes/*.smoke.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end

# task :parallel do |t, args|
#   @num_parallel = 4

#   Parallel.map([*1..@num_parallel], :in_processes => @num_parallel) do |task_id|
#     ENV["TASK_ID"] = (task_id - 1).to_s
#     ENV['name'] = "parallel_test"
#     ENV['CONFIG_NAME'] = "parallel"

#     Rake::Task["single"].invoke
#     Rake::Task["single"].reenable
#   end
# end

task :chrome do |t, args|
  ENV['BROWSER_NAME'] ||= "chrome"
  Rake::Task["smoke_prod"].invoke
  #Rake::Task["single"].reenable
  # Rake::Task["local"].invoke
  # Rake::Task["parallel"].invoke
end

task :firefox do |t, args|
  ENV['BROWSER_NAME'] ||= "firefox"
  Rake::Task["smoke_prod"].invoke
  #Rake::Task["single"].reenable
  # Rake::Task["local"].invoke
  # Rake::Task["parallel"].invoke
end
