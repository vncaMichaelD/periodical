module SeeAlsos

  def self.included(base)
        base.one_to_many :see_also

        base.def_nested_record(:the_property => :see_alsos,
                               :contains_records_of_type => :see_also,
                               :corresponding_to_association => :see_also)
  end

end
