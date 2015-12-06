module ItamaeExecutor
  class << self
    def role_name
      case `uname`.strip
      when 'Darwin'
        'darwin'
      else
        abort "Unexpected uname: #{`uname`}"
      end
    end

    def execute_role(role, itamae_options: nil, stackprof: false)
      cmd = itamae_local(role, itamae_options: itamae_options, stackprof: stackprof)
      cmd.push('lib/recipe_helper.rb', "roles/#{role}/default.rb")
      printf "\e[32m#{cmd.join(' ')}\e[0m\n"
      system(*cmd)
    end

    def execute(itamae_options: nil, stackprof: false)
      execute_role(role_name, itamae_options: itamae_options, stackprof: stackprof)
    end

    private

    def itamae_local(role, itamae_options:, stackprof:)
      node_path = File.expand_path("../roles/#{role}/node.yml", __dir__)

      cmd = %w[bundle exec itamae local]
      cmd.push(*itamae_options.split(' ')) if itamae_options
      cmd.push('-y', node_path) if File.exist?(node_path)
      cmd << 'lib/stackprof_runner.rb' if stackprof
      cmd
    end
  end
end
