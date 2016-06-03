class Ohsession < Sequel::Model(:ohsession)
  include ASModel
  corresponds_to JSONModel(:ohsession)

  set_model_scope :repository

end
