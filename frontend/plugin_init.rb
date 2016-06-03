my_routes = [File.join(File.dirname(__FILE__), "routes.rb")]
ArchivesSpace::Application.config.paths['config/routes'].concat(my_routes)

ArchivesSpace::Application.config.after_initialize do
 
   # Force the module to load
   ApplicationController

	class ApplicationController < ActionController::Base

	  def find_opts
		{
		  "resolve[]" => ["subjects", "related_resources", "linked_agents",
						  "revision_statements", "prdcl_links", 
						  "container_locations", "digital_object", "classifications",
						  "related_agents", "resource", "parent", "creator",
						  "linked_instances", "linked_records", "related_accessions",
						  "linked_events", "linked_events::linked_records",
						  "linked_events::linked_agents"]
		}
	  end

	end

   
end