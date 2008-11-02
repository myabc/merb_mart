$LOAD_PATH.unshift Merb.root / ".." / ".."
$LOAD_PATH.unshift Merb.root / ".." / ".." / "lib"
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

require 'merb-haml'

require 'merb-slices'
require "merb_mart"