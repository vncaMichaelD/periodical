class Military < Sequel::Model(:military)
  include ASModel
  corresponds_to JSONModel(:military)

  set_model_scope :global

end
