Sequel.migration do

  up do
    $stderr.puts("VVA adding Periodical Titles tables.")

    create_table(:prdcl_title) do
      primary_key :id

      Integer :lock_version, :default => 0, :null => false
      Integer :json_schema_version, :null => false
	  
	  HalfLongString :title
	  String :publication
	  String :publisher

      apply_mtime_columns
    end
	
    create_table(:prdcl_ti_rlshp) do
      primary_key :id
	  Integer :prdcl_id
      Integer :prdcl_title_id
      Integer :aspace_relationship_position

      apply_mtime_columns(false)
    end

    alter_table(:prdcl_ti_rlshp) do
	  add_foreign_key([:prdcl_id], :prdcl, :key => :id)
      add_foreign_key([:prdcl_title_id], :prdcl_title, :key => :id)
	  add_column(:suppressed, :integer, :null => false, :default => 0)
    end

  end

end
