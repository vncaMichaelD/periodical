module Notaccepteds

  def self.included(base)
    base.one_to_many :notaccepted

    base.def_nested_record(:the_property => :notaccepteds,
                           :contains_records_of_type => :notaccepted,
                           :corresponding_to_association  => :notaccepted)
  end

end
