require 'bundler/setup'
require_relative './lib/itamae_executor'

roles = Dir.glob('./roles/*').map { |dir| File.basename(dir) }.sort
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

desc 'apply for vagrant'
task :vagrant do
  ItamaeExecutor.system(*%w[
    bundle exec itamae ssh --vagrant
    -y roles/linux/node.yml
    lib/recipe_helper.rb roles/linux/sudo.rb
  ])
  ItamaeExecutor.system(*%w[
    bundle exec itamae ssh --vagrant --no-sudo
    -y roles/linux/node.yml
    lib/recipe_helper.rb roles/linux/default.rb
  ])
end

namespace :vagrant do
  desc 'debug for vagrant'
  task :debug do
    ItamaeExecutor.system(*%w[
      bundle exec itamae ssh --vagrant --log-level=debug
      -y roles/linux/node.yml
      lib/recipe_helper.rb roles/linux/sudo.rb
    ])
    ItamaeExecutor.system(*%w[
      bundle exec itamae ssh --vagrant --no-sudo --log-level=debug
      -y roles/linux/node.yml
      lib/recipe_helper.rb roles/linux/default.rb
    ])
  end
end

task default: :apply
