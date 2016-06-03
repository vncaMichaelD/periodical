module MapSubs

  def self.included(base)
        base.one_to_many :map_sub

        base.def_nested_record(:the_property => :map_subs,
                               :contains_records_of_type => :map_sub,
                               :corresponding_to_association => :map_sub)
  end

end
