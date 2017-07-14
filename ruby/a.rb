require 'parallel'

@browsers = ['chrome', 'firefox', 'safari', 'ie']
# Parallel.map(@browsers, :in_processes => @browsers.length) do |task_id|
#     puts task_id

# puts '---------------------'
# Parallel.map(@browsers, :in_threads => @browsers.length) do |task_id|
#     puts task_id
# end


puts './dasdas/dasdsa.rb'.split('/').last.split('.').first