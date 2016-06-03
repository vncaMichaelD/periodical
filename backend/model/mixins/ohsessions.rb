module Ohsessions

  def self.included(base)
        base.one_to_many :ohsession


        base.def_nested_record(:the_property => :ohsessions,
                               :contains_records_of_type => :ohsession,
                               :corresponding_to_association => :ohsession)
  end

end
