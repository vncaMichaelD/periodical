class MapSub < Sequel::Model(:map_sub)
  include ASModel
  corresponds_to JSONModel(:map_sub)
  
  set_model_scope :global

end
