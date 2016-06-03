class Audiovisual < Sequel::Model(:audiovisual)
  include ASModel
  corresponds_to JSONModel(:audiovisual)

  set_model_scope :global

end
