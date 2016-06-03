{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "subtype" => "ref",
    "properties" => {
      "ref" => {"type" => "JSONModel(:prdcl_title) uri", "ifmissing" => "error"},
      "_resolved" => {
        "type" => "object",
        "readonly" => "true"
      }
    },
  },
}
