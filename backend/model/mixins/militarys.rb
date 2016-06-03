module Militarys

  def self.included(base)
        base.one_to_many :military


        base.def_nested_record(:the_property => :militarys,
                               :contains_records_of_type => :military,
                               :corresponding_to_association => :military)
  end

end
