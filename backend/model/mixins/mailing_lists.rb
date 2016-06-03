module MailingLists

  def self.included(base)
        base.one_to_many :mailing_list


        base.def_nested_record(:the_property => :mailing_lists,
                               :contains_records_of_type => :mailing_list,
                               :corresponding_to_association => :mailing_list)
  end

end
