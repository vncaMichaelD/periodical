module Maps

  def self.included(base)
        base.one_to_many :map

        base.def_nested_record(:the_property => :maps,
                               :contains_records_of_type => :map,
                               :corresponding_to_association => :map)
  end

end
