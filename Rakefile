require 'bundler/setup'

roles = Dir.glob('./roles/*').map { |dir| File.basename(dir) }.sort
roles.each do |role|
  desc "configure #{role}"
  task role do
    node_path = File.expand_path("./roles/#{role}/node.yml", __dir__)
    cmd = %w[bundle exec itamae local]
    cmd << ENV['ITAMAE_OPTIONS'] if ENV['ITAMAE_OPTIONS']
    cmd.push('-y', node_path) if File.exist?(node_path)
    cmd << 'lib/recipe_helper.rb'
    cmd << "roles/#{role}/default.rb"
    system(*cmd)
  end
end

desc 'apply configuretion for current OS'
task :apply do
  case `uname`.strip
  when 'Darwin'
    Rake::Task['darwin'].invoke
  else
    abort "Unexpected uname: #{`uname`}"
  end
end

desc 'dry-run for current OS'
task 'dry-run' do
  ENV['ITAMAE_OPTIONS'] ||= '--dry-run'
  Rake::Task['apply'].invoke
end

task default: :apply
