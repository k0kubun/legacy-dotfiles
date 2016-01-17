module ItamaeExecutor
  class << self
    def role_name
      `uname`.strip.downcase
    end

    def execute_role(role, itamae_options: nil, stackprof: false)
      execute_default(role, itamae_options: itamae_options, stackprof: stackprof)
    end

    def execute(itamae_options: nil, stackprof: false)
      execute_role(role_name, itamae_options: itamae_options, stackprof: stackprof)
    end

    def execute_sudo(role, itamae_options: nil, stackprof: false)
      abort "roles/#{role}/sudo.rb is not found" unless File.exist?("roles/#{role}/sudo.rb")
      cmd = ['sudo', *itamae_local(role, itamae_options: itamae_options, stackprof: stackprof)]
      cmd.push('lib/recipe_helper.rb', "roles/#{role}/sudo.rb")
      green_puts(" INFO : #{cmd.join(' ')}")
      system(*cmd)
    end

    private

    def execute_default(role, itamae_options:, stackprof:)
      cmd = itamae_local(role, itamae_options: itamae_options, stackprof: stackprof)
      cmd.push('lib/recipe_helper.rb', "roles/#{role}/default.rb")
      green_puts(" INFO : #{cmd.join(' ')}")
      system(*cmd)
    end

    def itamae_local(role, itamae_options:, stackprof:)
      node_path = File.expand_path("../roles/#{role}/node.yml", __dir__)

      cmd = %w[bundle exec itamae local]
      cmd.push(*itamae_options.split(' ')) if itamae_options
      cmd.push('-y', node_path) if File.exist?(node_path)
      cmd << 'lib/stackprof_runner.rb' if stackprof
      cmd
    end

    def green_puts(str)
      printf "\e[32m#{str}\e[0m\n"
    end
  end
end
