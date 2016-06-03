class SeeAlso < Sequel::Model(:see_also)
  include ASModel
  corresponds_to JSONModel(:see_also)

  set_model_scope :global

end
