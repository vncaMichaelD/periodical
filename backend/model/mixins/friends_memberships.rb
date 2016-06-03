module FriendsMemberships

  def self.included(base)
        base.one_to_many :friends_membership


        base.def_nested_record(:the_property => :friends_memberships,
                               :contains_records_of_type => :friends_membership,
                               :corresponding_to_association => :friends_membership)
  end

end
