#!/usr/bin/env rake

desc "Export Karabiner preferences"
task :export do
  system("/Applications/Karabiner.app/Contents/Library/bin/karabiner export > script/karabiner_export.sh")
end

task default: :export
