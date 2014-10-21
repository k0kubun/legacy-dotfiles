#!/usr/bin/env ruby

# These recipes are executed first in this order
PRIMARY_RECIPES = %w[
  command_line_tools
  brew
]

RESOURCE_PLUGINS = %w[
  cask
]

# Self execution by ./bootstrap.rb
if ARGV.length == 0
  exit system("bundle exec itamae local -l debug #{File.expand_path(__FILE__)}")
end

RESOURCE_PLUGINS.each do |name|
  require "itamae/plugin/resource/#{name}"
end

recipes_dir = File.expand_path("../recipes", __FILE__)

all_recipes = Dir.glob(File.join(recipes_dir, "*"))
primary_recipes = PRIMARY_RECIPES.map do |recipe_name|
  File.join(recipes_dir, "#{recipe_name}.rb")
end

(primary_recipes + (all_recipes - primary_recipes)).each do |recipe|
  include_recipe recipe
end
