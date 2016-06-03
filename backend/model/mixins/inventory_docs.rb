module InventoryDocs

  def self.included(base)
        base.one_to_many :inventory_doc


        base.def_nested_record(:the_property => :inventory_docs,
                               :contains_records_of_type => :inventory_doc,
                               :corresponding_to_association => :inventory_doc)
  end

end
