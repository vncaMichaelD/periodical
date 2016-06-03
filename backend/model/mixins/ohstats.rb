module Ohstats

  def self.included(base)
        base.one_to_many :ohstat


        base.def_nested_record(:the_property => :ohstats,
                               :contains_records_of_type => :ohstat,
                               :corresponding_to_association => :ohstat)
  end

end
