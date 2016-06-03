module Civilians

  def self.included(base)
        base.one_to_many :civilian


        base.def_nested_record(:the_property => :civilians,
                               :contains_records_of_type => :civilian,
                               :corresponding_to_association => :civilian)
  end

end
