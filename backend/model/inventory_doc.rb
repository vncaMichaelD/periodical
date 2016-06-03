class InventoryDoc < Sequel::Model(:inventory_doc)
  include ASModel
  corresponds_to JSONModel(:inventory_doc)

  set_model_scope :global

end
