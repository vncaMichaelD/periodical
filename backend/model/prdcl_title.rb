class PrdclTitle < Sequel::Model(:prdcl_title)
  include ASModel
  corresponds_to JSONModel(:prdcl_title)

  include AutoGenerator
  
  set_model_scope :global


  def self.generate_title(json)
    title = ""

    title << json['publication']
    title << " (#{json['publisher']})" if json['publisher']

    title
  end

  auto_generate :property => :title,
                :generator => proc {|json|
                  PrdclTitle.generate_title(json)
                }


  def delete
    # only allow delete if the prdcl_title doesn't have any relationships
    object_graph = self.object_graph

    if object_graph.models.any? {|model| model.is_relationship?}
      raise ConflictException.new("Periodical title cannot be deleted if linked")
    end

    super
  end

end
