class Prdcl < Sequel::Model(:prdcl)
  include ASModel
  corresponds_to JSONModel(:prdcl)

  include Relationships

  set_model_scope :global
  
  def self.handle_delete(ids)
    relationship_defn = find_relationship(:prdcl_ti)
    relationships = relationship_defn.find_by_participant_ids(self, ids)

    relationship_defn.handle_delete(relationships.map(&:id))
    super
  end
  
  define_relationship(:name => :prdcl_ti,
                      :json_property => 'prdcl_links',
                      :contains_references_to_types => proc {[PrdclTitle]},
				)
end
