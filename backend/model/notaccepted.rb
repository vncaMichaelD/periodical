class Notaccepted < Sequel::Model(:notaccepted)
  include ASModel
  corresponds_to JSONModel(:notaccepted)

  include Extents

  set_model_scope :repository


end
