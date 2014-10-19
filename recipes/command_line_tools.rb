execute "xcode-select --install" do
  not_if "xcode-select -p"
end
execute %Q[ruby -e 'sleep 5 until system("xcode-select -p")']

agree_script = File.expand_path("../../bin/agree_license", __FILE__)
execute "sudo #{agree_script}" do
  only_if "gcc 2>&1 | grep Agreeing"
end
