# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

# Make the app's "lib" directory a place where ruby files get "require"d from
$LOAD_PATH.unshift(Merb.root / "lib")


Merb::Config.use do |c|
  c[:session_secret_key]  = 'efeb3cd8e1d8a6deedefd479843705ff21c022a1'
  #c[:session_store] = 'datamapper' -- TEMPORARILY DISABLE
  c[:session_store] = 'cookie'
end  

### Globals
MEGABYTE = 1024.0 * 1024.0
MAX_SIZE = 10 * MEGABYTE

### Specify the ORM: DataMapper
use_orm :dm_core

### Specify the Test Framework: RSpec
use_test :rspec

### Specify Other Dependencies

# These are some examples of how you might specify dependencies.
#
# dependencies "RedCloth", "merb_helpers"
# OR
# dependency "RedCloth", "> 3.0"
# OR
# dependencies "RedCloth" => "> 3.0", "ruby-aes-cext" => "= 1.0"

dependency "merb-assets"
dependency "merb-mailer"
dependency "merb_helpers"
dependency "merb_paginate"
dependency "ezcrypto"

#MerbPaginate.activate! :finder => :datamapper # require the custom finder for datamapper
#MerbPaginate.activate! :view_helpers # require the will_paginate view helper

Merb::BootLoader.after_app_loads do
  ### Add dependencies here that must load after the application loads:

  # dependency "magic_admin" # this gem uses the app's model classes
end
