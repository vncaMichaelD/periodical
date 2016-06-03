class MapGrid < Sequel::Model(:map_grid)
  include ASModel
  corresponds_to JSONModel(:map_grid)
  
  set_model_scope :global

  def self.sequel_to_jsonmodel(objs, opts = {})
    jsons = super

    jsons.zip(objs).each do |json, obj|
      p json
      west = json['west'] ? json['west'] : ""
      east = json['east'] ? json['east'] : ""
	  json['eastwest'] = ""
	  if !east.empty?
	    json['eastwest'] += "#{east} "
	  end
	  if !west.empty?
	    json['eastwest'] += "#{west} "
	  end
      north = json['north'] ? json['north'] : ""
      south = json['south'] ? json['south'] : ""
	  json['northsouth'] = ""
	  if !south.empty?
	    json['northsouth'] += "#{south} "
	  end
	  if !north.empty?
	    json['northsouth'] += "#{north} "
	  end
    end

    jsons
  end
  
end
