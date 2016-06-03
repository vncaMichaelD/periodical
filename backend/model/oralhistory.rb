class Oralhistory < Sequel::Model(:oralhistory)
  include ASModel
  corresponds_to JSONModel(:oralhistory)

  include Ohstats
  include Ohsessions
  include Ohforms

  set_model_scope :repository

end
