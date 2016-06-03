class Staff < Sequel::Model(:staff)
  include ASModel
  corresponds_to JSONModel(:staff)
  
  include Telephones

  set_model_scope :global

end
