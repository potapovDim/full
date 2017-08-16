LOCATION_RUNNER = ENV['LOCATION_RUNNER']

require_relative '../helpers/index'

assert_elasticsearch_run

require_relative "./#{LOCATION_RUNNER}.rb"