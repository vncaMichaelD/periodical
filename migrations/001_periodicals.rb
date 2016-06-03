Sequel.migration do

  up do
    $stderr.puts("Adding VVA Periodical tables, fields, and constraints.")

    create_table(:prdcl) do
      primary_key :id

      Integer :lock_version, :default => 0, :null => false
      Integer :json_schema_version, :null => false

	  Integer :digital_object_id
      String :publication
      String :volume_num
      String :issue_num
      String :num_of_articles
      String :num_of_issues
	  String :donor
	  String :publisher
	  String :pub_city
	  String :pub_country
	  Integer :pub_frequency_id
	  Integer :pub_format_id

	  Integer :potential
	  String :association
	  String :contact_name
	  String :address
	  String :phone
	  String :email
	  String :place
	  String :city
	  String :state
	  String :country
	  String :zip
	  TextField :general_note
	  String :start
	  String :end

      apply_mtime_columns

	  Integer :star_record
    end
	
    alter_table(:prdcl) do
	  add_foreign_key([:digital_object_id], :digital_object, :key => :id)
    end

    create_editable_enum('prdcl_pub_frequency', ["daily", "weekly", "biweekly", "monthly", "bimonthly", "varied"])
    create_editable_enum('prdcl_pub_format', ["hardcopy", "microfilm", "microfiche"])
  end

end
