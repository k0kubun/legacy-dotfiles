INSTALL_CHECK   = "xcode-select -p"

execute "xcode-select --install" do
  not_if INSTALL_CHECK
end
execute %Q{ruby -e 'sleep 5 until system("#{INSTALL_CHECK}")'}

agree_script = File.expand_path("../../bin/agree_license", __FILE__)
execute agree_script do
  only_if "gcc 2>&1 | grep Agreeing"
end
