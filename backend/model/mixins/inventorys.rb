module Inventorys

  def self.included(base)
        base.one_to_many :inventory


        base.def_nested_record(:the_property => :inventorys,
                               :contains_records_of_type => :inventory,
                               :corresponding_to_association => :inventory)
  end

end
