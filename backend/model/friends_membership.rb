class FriendsMembership < Sequel::Model(:friends_membership)
  include ASModel
  corresponds_to JSONModel(:friends_membership)

  set_model_scope :global

end
