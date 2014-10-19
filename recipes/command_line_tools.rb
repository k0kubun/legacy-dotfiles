execute "xcode-select --install" do
  not_if "xcode-select -p"
end
