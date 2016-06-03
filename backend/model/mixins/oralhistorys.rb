module Oralhistorys

  def self.included(base)
        base.one_to_many :oralhistory

        base.def_nested_record(:the_property => :oralhistory,
                               :contains_records_of_type => :oralhistory,
                               :corresponding_to_association => :oralhistory)
  end

end
