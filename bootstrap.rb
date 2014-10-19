#!/usr/bin/env ruby

# These recipes are executed first in this order
PRIMARY_RECIPES = %w[
  command_line_tools
  brew
]

# Self execution by ./bootstrap.rb
if ARGV.length == 0
  require "itamae/runner"

  script_path = File.expand_path(__FILE__)
  system("itamae local #{script_path}")
  exit 0
end

recipes_dir = File.expand_path("../recipes", __FILE__)

all_recipes = Dir.glob(File.join(recipes_dir, "*"))
primary_recipes = PRIMARY_RECIPES.map do |recipe_name|
  File.join(recipes_dir, "#{recipe_name}.rb")
end

(primary_recipes + (all_recipes - primary_recipes)).each do |recipe|
  include_recipe recipe
end
