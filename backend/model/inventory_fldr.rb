class InventoryFldr < Sequel::Model(:inventory_fldr)
  include ASModel
  corresponds_to JSONModel(:inventory_fldr)

  include InventoryDocs

  set_model_scope :global

end
