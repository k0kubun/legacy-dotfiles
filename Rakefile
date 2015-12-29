require 'bundler/setup'
require_relative './itamae/lib/itamae_executor'

roles = Dir.glob('./itamae/roles/*').map { |dir| File.basename(dir) }.sort
roles.each do |role|
  desc "configure #{role}"
  task role do
    ItamaeExecutor.execute_role(role)
  end
end

desc 'apply configuretion for current OS'
task :apply do
  ItamaeExecutor.execute
end

desc 'debugging apply for current OS'
task :debug do
  ItamaeExecutor.execute(itamae_options: '--log-level=debug')
end

desc 'profile configuration for current OS'
task :profile do
  ItamaeExecutor.execute(stackprof: true)
end

desc 'dry-run for current OS'
task 'dry-run' do
  ItamaeExecutor.execute(itamae_options: '--dry-run --log-level=debug')
end

task default: :apply
