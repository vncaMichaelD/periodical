class Civilian < Sequel::Model(:civilian)
  include ASModel
  corresponds_to JSONModel(:civilian)

  set_model_scope :global

end
