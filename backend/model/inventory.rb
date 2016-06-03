class Inventory < Sequel::Model(:inventory)
  include ASModel
  corresponds_to JSONModel(:inventory)

  include InventoryFldrs

  set_model_scope :global

end
