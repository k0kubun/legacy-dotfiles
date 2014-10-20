execute "install command line tools" do
  not_if "xcode-select -p"
  command <<-EOS
    xcode-select --install
    while ! xcode-select -p 2> /dev/null; do
      sleep 5
    done
  EOS
end

execute "accept license agreement" do
  only_if "gcc 2>&1 | grep Agreeing"
  command "sudo #{File.expand_path("../../bin/agree_license", __FILE__)}"
end
