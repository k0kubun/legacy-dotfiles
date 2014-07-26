#!/usr/bin/env ruby

# ************
# * Launcher *
# ************

item "Application shortcuts" do
  remap "C-o", to: invoke("YoruFukurou")
  remap "C-u", to: invoke("Google Chrome")
  remap "C-h", to: invoke("iTerm")
end


# ****************
# * Basic Remaps *
# ****************

item "Use Option_L and Option_R as Shift" do
  remap "Opt_L", to: "Shift_L"
  remap "Opt_R", to: "Shift_R"
end

item "Use Command_L as Control" do
  remap "Cmd_L", to: "Ctrl_R"
end


# **************************************************
# * Option Key Replacement (Use Cmd as Option too) *
# **************************************************

# M-o, M-p: Tab moves
item "Command+O|P to Option+{|}", only: "TERMINAL" do
  remap "Cmd-P", to: "Opt-Shift-]"
  remap "Cmd-O", to: "Opt-Shift-["
end
item "Command+O|P to Command+{|}", not: "TERMINAL" do
  remap "Cmd-P", to: "Cmd-Shift-]"
  remap "Cmd-O", to: "Cmd-Shift-["
end

# M-t: Tab create
item "Command+T to Option+T, Command+E to Option+E", only: "TERMINAL" do
  remap "Cmd-T", to: "Opt-T"
  remap "Cmd-E", to: "Opt-E"
end

# M-e: Tab close
item "Command+E to Command+W", not: "TERMINAL" do
  remap "Cmd-E", to: "Cmd-W"
end

# M-i: For tmux copy mode
item "Command+I to Option+I", only: "TERMINAL" do
  remap "Cmd-I", to: "Opt-I"
end

# M-d: Forward word delete
item "Command+D to Option+Forward Delete", not: "TERMINAL" do
  remap "Cmd-D", to: "Opt-forward_delete"
end
item "Terminal M-d", only: "TERMINAL" do
  remap "Cmd-D", to: "M-d"
end

# M-r: tmux prefix
item "Command-R -> Option-R", only: "TERMINAL" do
  remap "Cmd-R", to: "M-r"
end

# M-b, M-f: Word move
item "Command+D to Option+D, Command+BF to Option+BF", only: "TERMINAL" do
  remap "Cmd-B", to: "M-b"
  remap "Cmd-F", to: "M-f"
end
item "Command+B/F to Option+Left/Right", not: "TERMINAL" do
  remap "Cmd-B", to: "Opt-Left"
  remap "Cmd-F", to: "Opt-Right"
end


# **********
# * Others *
# **********

appdef "YORUFUKUROU", equal: "com.YoruFukurouProject.YoruFukurou"
appdef "CHROME", equal: "com.google.Chrome"
# appdef "MACVIM", equal: "org.vim.MacVim"

# CaplsLock by Cmd_L+L
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

# Use Cmd_R+S as Cmd+F to avoid conflict with M-f
item "Command+S to Command+F", not: "TERMINAL" do
  remap "Cmd-S", to: "Cmd-F"
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

item "Control+PNBF to Up/Down/Left/Right", not: "TERMINAL" do
  remap "C-p", to: "Up"
  remap "C-n", to: "Down"
  remap "C-b", to: "Left"
  remap "C-f", to: "Right"
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

# I don't want to press shift key
item "Command semicolon to colon" do
  remap "Cmd-;", to: "Shift-;"
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
  remap "Cmd-tab", to: "Cmd-F1"
end
