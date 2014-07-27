#!/usr/bin/env ruby

appdef "YORUFUKUROU", equal: "com.YoruFukurouProject.YoruFukurou"
appdef "CHROME", equal: "com.google.Chrome"

item "Application shortcuts" do
  remap "C-o", to: invoke("YoruFukurou")
  remap "C-u", to: invoke("Google Chrome")
  remap "C-h", to: invoke("iTerm")
end

item "Command+O|P to Command+{|}", not: "TERMINAL" do
  remap "Cmd-P", to: "Cmd-Shift-]"
  remap "Cmd-O", to: "Cmd-Shift-["
end

item "Command+O|P to Option+{|}", only: "TERMINAL" do
  remap "Cmd-P", to: "Opt-Shift-]"
  remap "Cmd-O", to: "Opt-Shift-["
end

item "Command+E to Command+W", not: "TERMINAL" do
  remap "Cmd-E", to: "Cmd-W"
end

item "Command+T to Option+T, Command+E to Option+E", only: "TERMINAL" do
  remap "Cmd-T", to: "Opt-T"
  remap "Cmd-E", to: "Opt-E"
end

# For tmux copy mode
item "Command+I to Option+I", only: "TERMINAL" do
  remap "Cmd-I", to: "Opt-I"
end

item "Command_L to Control_R" do
  remap "Cmd_L", to: "Ctrl_R"
end

# Change japanese input mode by Cmd_L + Space
item "Exchange Control + Space and Command + Space" do
  remap "C-Space", to: "Cmd-Space"
  remap "Cmd-Space", to: "C-Space"
end

# Cmd-L is used by CapsLock
item "Command+K to Command+L", only: "CHROME" do
  remap "Cmd-K", to: "Cmd-L"
end

item "CapsLock ON", config_not: "notsave.private_capslock_on" do
  remap "Cmd-L", to: ["capslock", "VK_CONFIG_FORCE_ON_notsave_private_capslock_on"]
end

item "CapsLock OFF", config_only: "notsave.private_capslock_on" do
  remap "Cmd-L", to: ["capslock", "VK_CONFIG_FORCE_OFF_notsave_private_capslock_on"]
end

item "CapsLock Mode" do
  identifier "notsave.private_capslock_on", vk_config: "true"
  show_message "CapsLock"
end

item "Control+PNBF to Up/Down/Left/Right", not: "TERMINAL" do
  remap "C-p", to: "Up"
  remap "C-n", to: "Down"
  remap "C-b", to: "Left"
  remap "C-f", to: "Right"
end

# Use Cmd_R+D as M-d
item "Command+D to Option+Forward Delete", not: "TERMINAL" do
  remap "Cmd-D", to: "Opt-forward_delete"
end

item "Command+D to Option+D, Command+BF to Option+BF", only: "TERMINAL" do
  remap "Cmd-D", to: "M-d"
  remap "Cmd-B", to: "M-b"
  remap "Cmd-F", to: "M-f"
end

# Use Cmd_R+B/F as M-b/f, and Cmd_R+S as Cmd+F to avoid conflict with M-f
item "Command+B/F to Option+Left/Right, Command+S to Command+F", not: "TERMINAL" do
  remap "Cmd-B", to: "Opt-Left"
  remap "Cmd-F", to: "Opt-Right"
  remap "Cmd-S", to: "Cmd-F"
end

item "Control+W to Option+Delete", not: "TERMINAL" do
  remap "C-w", to: "Opt-delete"
end

item "Control+LeftClick to Command+LeftClick" do
  autogen "__PointingButtonToPointingButton__ PointingButton::LEFT, MODIFIERFLAG_EITHER_LEFT_OR_RIGHT_CONTROL, PointingButton::LEFT, MODIFIERFLAG_EITHER_LEFT_OR_RIGHT_COMMAND"
end

item "YoruFukurou Account Change", only: "YORUFUKUROU" do
  remap "Cmd-K", to: "Cmd-Opt-Up"
  remap "Cmd-J", to: "Cmd-Opt-Down"
end

item "Chrome inspector Command+Control+I", not: "TERMINAL" do
  remap "Cmd-Ctrl-I", to: "Cmd-Opt-i"
end

# browser reload
item "Control-R -> Command-R", not: "TERMINAL" do
  remap "C-r", to: "Cmd-R"
end

item "Tmux configs", only: "TERMINAL" do
  # Prefix
  remap "Cmd-K", to: "M-k"

  # Window change
  (1..6).each do |index|
    remap "Cmd-#{index}", to: "M-#{index}"
  end
end

# I don't want to press shift key
item "Command semicolon to colon" do
  remap "Cmd-;", to: "Shift-;"
end

item "tmux resize", only: "TERMINAL" do
  remap "Cmd-,", to: "Shift-,"
  remap "Cmd-.", to: "Shift-."
end

item "Open config" do
  remap "Opt-,", to: "Cmd-,"
end

item "Shift by control" do
  remap "C--", to: "Shift--"
  remap "C-0", to: "Shift-0"
  remap "C-9", to: "Shift-9"
  remap "C-8", to: "Shift-8"
  remap "C-7", to: "Shift-7"
  remap "C-6", to: "Shift-6"
  remap "C-[", to: "Shift-["
  remap "C-]", to: "Shift-]"
  remap "C-;", to: "Shift-;"
  remap "C-,", to: "Shift-,"
  remap "C-.", to: "Shift-."
  remap "C-/", to: "Shift-/"
  remap "C-=", to: "Shift-="
  remap "C-\\", to: "Shift-\\"
end

item "Exchange single quote and double quote" do
  remap "Shift-'", to: "'"
  remap "'", to: "Shift-'"
end

item "Command+A to Option+A", only: "TERMINAL" do
  remap "Cmd-A", to: "M-a"
end

item "Disable Command-W" do
  remap "Cmd-W", to: "w"
end

item "Screen shot" do
  remap "Ctrl-Shift-4", to: "Cmd-Shift-4"
  remap "Ctrl-Shift-3", to: "Cmd-Shift-3"
  remap "Opt-Shift-4", to: "Cmd-Shift-4"
  remap "Opt-Shift-3", to: "Cmd-Shift-3"
end

item "Window change in the same app" do
  remap "Opt-tab", to: "Cmd-F1"
end
