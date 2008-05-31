class Right

  include DataMapper::Resource

  property :id,         Integer, :serial => true
  property :name,       String
  property :controller, String
  property :actions,    String

  # many_to_many :roles
  def roles
    rels = RightRoles.all(:right_id => self.id).map {|r| r.role_id}
    rels.empty? ? [] : Role.all(:id => rels)
  end

end

# FIXME:
# Hack! Work-around no DM many-to-many
#
class RightRoles
  include DataMapper::Resource
  property :right_id,  Integer, :key => true
  property :role_id,   Integer, :key => true
end
