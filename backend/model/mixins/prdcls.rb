module Prdcls

  def self.included(base)
        base.one_to_many :prdcl

        base.def_nested_record(:the_property => :prdcls,
                               :contains_records_of_type => :prdcl,
                               :corresponding_to_association => :prdcl)
  end

end
