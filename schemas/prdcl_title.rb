{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
	"uri" => "/prdcl_titles",
    "properties" => {
	  "uri" => {"type" => "string", "required" => false},
	  "title" => {"type" => "string", "readonly" => true},
      "publication" => {"type" => "string", "maxLength" => 255, "minLength" => 1, "ifmissing" => "error"},
	  "publisher" => {"type" => "string", "maxLength" => 255},
	  
    },
  },
}
