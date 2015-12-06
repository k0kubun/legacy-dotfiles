require 'bundler/setup'

roles = Dir.glob('./roles/*').map { |dir| File.basename(dir) }.sort
roles.each do |role|
  desc "configure #{role}"
  task role do
    system("bundle exec itamae local #{ENV['ITAMAE_OPTIONS']} lib/recipe_helper.rb roles/#{role}/default.rb")
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
