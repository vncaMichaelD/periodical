module Audiovisuals

  def self.included(base)
        base.one_to_many :audiovisual

        base.def_nested_record(:the_property => :audiovisuals,
                               :contains_records_of_type => :audiovisual,
                               :corresponding_to_association => :audiovisual)
  end

end
