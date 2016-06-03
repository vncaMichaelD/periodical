class PrdclLink < Sequel::Model(:prdcl_link)

  include ASModel
  corresponds_to JSONModel(:prdcl_link)

end
