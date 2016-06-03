class CommonIndexer

  @@record_types << :prdcl_title
  
  @@global_types << :prdcl_title

  self.add_indexer_initialize_hook do |indexer|

    indexer.add_document_prepare_hook {|doc, record|
	
      if doc['primary_type'] == 'digital_object'
		if record['record']['prdcls'] && record['record']['prdcls'].length > 0
        doc['prdcl_title_uris'] = record['record']['prdcls'].
                                  collect{|prdcl| prdcl["ref"]}.uniq
        end
      end

	  if doc['primary_type'] == 'prdcl_title'
        doc['title'] = record['record']['title']
      end
	  
    }
  end

end
