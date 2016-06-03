module Staffs

  def self.included(base)
        base.one_to_many :staff


        base.def_nested_record(:the_property => :staffs,
                               :contains_records_of_type => :staff,
                               :corresponding_to_association => :staff)
  end

end
