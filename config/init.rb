#  __  __         _    __  __          _   
# |  \/  |___ _ _| |__|  \/  |__ _ _ _| |_ 
# | |\/| / -_) '_| '_ \ |\/| / _` | '_|  _|
# |_|  |_\___|_| |_.__/_|  |_\__,_|_|  \__|
#
# Copyright (C) 2008  Alex Coles
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# ==== Load paths
 
# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

# If you want modules and classes from libraries organized like
# merbapp/lib/magicwand/lib/magicwand.rb to autoload,
# uncomment this.
# Merb.push_path(:lib, Merb.root / "lib") # uses **/*.rb as path glob.

# ==== Dependencies

dependency "merb-assets"
dependency "merb-haml"
dependency "merb_helpers"
dependency "merb-mailer"
#dependency "merb_paginate"
dependency "merb_stories"

require "ezcrypto"

#MerbPaginate.activate! :finder => :datamapper # require the custom finder for datamapper
#MerbPaginate.activate! :view_helpers # require the will_paginate view helper

Merb::BootLoader.after_app_loads do
  ### Add dependencies here that must load after the application loads:

  # dependency "magic_admin" # this gem uses the app's model classes
end

# ==== Object Relation Mapping (ORM) Framework

# DataMapper
use_orm :datamapper

# ==== Testing Framework

# RSpec
use_test :rspec

# ==== Application Globals

MEGABYTE = 1024.0 * 1024.0
MAX_SIZE = 10 * MEGABYTE

# ==== Application Configuration

Merb::Config.use do |c|

  c[:session_secret_key]  = 'ea30e9cd9614d32ab7823fb081104ecca546beee'
  c[:session_store] = 'cookie'
  # c[:session_store] = 'datamapper'  ## FIXME: temporarily disabled
  # c[:use_mutex] = false             ## FIXME: disable Mutex
  
end  

# ==== Inflector Customization

# Language::English::Inflector.word "Store", "A Chain"
