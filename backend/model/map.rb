class Map < Sequel::Model(:map)
  include ASModel
  corresponds_to JSONModel(:map)

  include MapGrids
  include MapSubs
  
  set_model_scope :global

  def self.sequel_to_jsonmodel(objs, opts = {})
    jsons = super

    jsons.zip(objs).each do |json, obj|
      p json
      country = json['country'] ? json['country'] : ""
      country_alt = json['country_alt'] ? json['country_alt'] : ""
	  json['both_country'] = ""
	  if !country.empty?
	    json['both_country'] += "#{country} "
	  end
	  if !country_alt.empty?
	    json['both_country'] += "#{country_alt} "
	  end
	  
      nlat_degrees = json['nlat_degrees'] ? json['nlat_degrees'] : ""
      slat_degrees = json['slat_degrees'] ? json['slat_degrees'] : ""
	  json['northsouth_d'] = ""
	  if !nlat_degrees.empty?
	    json['northsouth_d'] += "#{nlat_degrees} "
	  end
	  if !slat_degrees.empty?
	    json['northsouth_d'] += "#{slat_degrees} "
	  end
	  
	  nlat_mins = json['nlat_mins'] ? json['nlat_mins'] : ""
      slat_mins = json['slat_mins'] ? json['slat_mins'] : ""
	  json['northsouth_m'] = ""
	  if !nlat_mins.empty?
	    json['northsouth_m'] += "#{nlat_mins} "
	  end
	  if !slat_mins.empty?
	    json['northsouth_m'] += "#{slat_mins} "
	  end
	  
	  wlon_degrees = json['wlon_degrees'] ? json['wlon_degrees'] : ""
      elon_degrees = json['elon_degrees'] ? json['elon_degrees'] : ""
	  json['eastwest_d'] = ""
	  if !wlon_degrees.empty?
	    json['eastwest_d'] += "#{wlon_degrees} "
	  end
	  if !elon_degrees.empty?
	    json['eastwest_d'] += "#{elon_degrees} "
	  end
	  
	  wlon_mins = json['wlon_mins'] ? json['wlon_mins'] : ""
      elon_mins = json['elon_mins'] ? json['elon_mins'] : ""
	  json['eastwest_m'] = ""
	  if !wlon_mins.empty?
	    json['eastwest_m'] += "#{wlon_mins} "
	  end
	  if !elon_mins.empty?
	    json['eastwest_m'] += "#{elon_mins} "
	  end
    end

    jsons
  end
  
end
