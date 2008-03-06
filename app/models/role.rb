# A role is a collection of rights.
#
class Role < DataMapper::Base
  
  has_and_belongs_to_many :users 
  has_and_belongs_to_many :rights, :order => 'name ASC'

  property :name,        :string
  property :description, :text

  # Sets rights by list of id's passed in
  def right_ids=(id_list)
    self.rights.clear
    for id in id_list
      next if id.empty?
      right = Right.find(id)
      self.rights << right if right
    end
  end

end