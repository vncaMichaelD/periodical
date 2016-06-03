class Ohstat < Sequel::Model(:ohstat)
  include ASModel
  corresponds_to JSONModel(:ohstat)

  set_model_scope :repository

end
