module ItamaeExecutor
  def self.role_name
    case `uname`.strip
    when 'Darwin'
      'darwin'
    else
      abort "Unexpected uname: #{`uname`}"
    end
  end

  def self.execute_role(role, itamae_options: nil, stackprof: false)
    node_path = File.expand_path("../roles/#{role}/node.yml", __dir__)
    cmd = %w[bundle exec itamae local]
    cmd.push(*itamae_options.split(' ')) if itamae_options
    cmd.push('-y', node_path) if File.exist?(node_path)
    cmd << 'lib/stackprof_runner.rb' if stackprof
    cmd << 'lib/recipe_helper.rb'
    cmd << "roles/#{role}/default.rb"
    system(*cmd)
  end

  def self.execute(itamae_options: nil, stackprof: false)
    execute_role(role_name, itamae_options: itamae_options, stackprof: stackprof)
  end
end
