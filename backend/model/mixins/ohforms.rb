module Ohforms

  def self.included(base)
        base.one_to_many :ohform


        base.def_nested_record(:the_property => :ohforms,
                               :contains_records_of_type => :ohform,
                               :corresponding_to_association => :ohform)
  end

end
