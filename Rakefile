# frozen_string_literal: true

require 'erb'
require 'dotenv'
Dotenv.load

task :create_conf do
  erb = ERB.new(
    File.read('lib/templates/fluent.conf.erb')
  )
  @json_key_filename = ENV.fetch('JSON_KEY_FILENAME', nil)
  @project_id = ENV.fetch('PROJECT_ID', nil)
  @dataset = ENV.fetch('DATASET', nil)
  @location = ENV.fetch('LOCATION', nil)
  @docker_table = ENV.fetch('DOCKER_TABLE', nil)
  @td_agent_table = ENV.fetch('TD_AGENT_TABLE', nil)
  filename = 'config/fluent.conf'
  File.write(filename, erb.result)
end
