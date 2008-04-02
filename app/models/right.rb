# A right is a controller resource that determines
# access.
#
# Rights are assigned to roles, roles to users.
#
# Rights consist of a controller name and an action list.
# This action list can be either '*' for access to all actions
# or a CSV list of actions.
#
class Right
  
  include DataMapper::Resource
  
  many_to_many  :roles

  property :id,         Fixnum, :serial => true
  property :name,       String
  property :controller, String
  property :actions,    String

end