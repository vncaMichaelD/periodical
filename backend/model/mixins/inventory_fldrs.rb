module InventoryFldrs

  def self.included(base)
        base.one_to_many :inventory_fldr


        base.def_nested_record(:the_property => :inventory_fldrs,
                               :contains_records_of_type => :inventory_fldr,
                               :corresponding_to_association => :inventory_fldr)
  end

end
