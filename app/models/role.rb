# A role is a collection of rights.
#
class Role
  
  include DataMapper::Resource
  
  many_to_many  :users
  many_to_many  :rights, :order => 'name ASC'

  property :id,          Fixnum, :serial => true
  property :name,        String
  property :description, DataMapper::Types::Text

  # Sets rights by list of id's passed in
  def right_ids=(id_list)
    self.rights.clear
    for id in id_list
      next if id.empty?
      right = Right[id]
      self.rights << right if right
    end
  end

end