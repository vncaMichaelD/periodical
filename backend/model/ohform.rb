class Ohform < Sequel::Model(:ohform)
  include ASModel
  corresponds_to JSONModel(:ohform)

  set_model_scope :repository

end
