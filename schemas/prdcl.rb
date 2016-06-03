{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "properties" => {
	
	  "publication" => {"type" => "string", "maxLength" => 255},
      "volume_num" => {"type" => "string", "maxLength" => 255},
      "issue_num" => {"type" => "string", "maxLength" => 255},
      "num_of_articles" => {"type" => "string", "maxLength" => 255},
      "num_of_issues" => {"type" => "string", "maxLength" => 255},
	  "donor" => {"type" => "string", "maxLength" => 255},
	  "publisher" => {"type" => "string", "maxLength" => 255},
	  "pub_city" => {"type" => "string", "maxLength" => 255},
	  "pub_country" => {"type" => "string", "maxLength" => 255},
	  "pub_frequency" => {"type" => "string", "dynamic_enum" => "prdcl_pub_frequency"},
	  "pub_format" => {"type" => "string", "dynamic_enum" => "prdcl_pub_format"},

	  "potential" => {"type" => "boolean"},
	  "association" => {"type" => "string", "maxLength" => 255},
	  "contact_name" => {"type" => "string", "maxLength" => 255},
	  "address" => {"type" => "string", "maxLength" => 255},
	  "phone" => {"type" => "string", "maxLength" => 255},
	  "email" => {"type" => "string", "maxLength" => 255},
	  "place" => {"type" => "string", "maxLength" => 255},
	  "city" => {"type" => "string", "maxLength" => 255},
	  "state" => {"type" => "string", "maxLength" => 255},
	  "country" => {"type" => "string", "maxLength" => 255},
	  "zip" => {"type" => "string", "maxLength" => 20},
	  "general_note" => {"type" => "string", "maxLength" => 65000},
	  "start" => {"type" => "string", "maxLength" => 255},
	  "end" => {"type" => "string", "maxLength" => 255},
	  "prdcl_links" => {
        "type" => "array", "minItems" => 1,
        "items" => {
          "type" => "JSONModel(:prdcl_link) object",
        }
      }
    },
  },
}
