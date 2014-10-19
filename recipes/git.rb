execute "gcc" do
  only_if "gcc 2>&1 | grep '^Agreeing'"
end
