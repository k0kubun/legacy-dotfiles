desc 'Apply with current dir'
task :apply do
  system('bundle exec serverkit apply recipe.yml.erb --variables=variables.yml')
end

desc 'Debug with current dir'
task :debug do
  system('bundle exec serverkit apply recipe.yml.erb --variables=variables.yml --log-level=DEBUG')
end

task default: :apply
