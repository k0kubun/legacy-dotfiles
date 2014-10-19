execute "xcode-select --install" do
  not_if "git version 2>&1 | grep '^git version'"
end
