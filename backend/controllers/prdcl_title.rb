class ArchivesSpaceService < Sinatra::Base

  Endpoint.post('/prdcl_titles/:id')
  .description("Update a Periodical Title")
  .params(["id", :id],
          ["prdcl_title", JSONModel(:prdcl_title), "The updated record", :body => true])
    .permissions([:update_prdcl_title_record])
  .returns([200, :updated]) \
  do
    handle_update(PrdclTitle, params[:id], params[:prdcl_title])
  end

  Endpoint.post('/prdcl_titles')
    .description("Create a Periodical Title")
    .params(["prdcl_title", JSONModel(:prdcl_title), "The record to create", :body => true])
    .permissions([:update_prdcl_title_record])
    .returns([200, :created]) \
  do
    handle_create(PrdclTitle, params[:prdcl_title])
  end


  Endpoint.get('/prdcl_titles')
    .description("Get a list of Periodical Titles")
    .params()
    .paginated(true)
    .permissions([])
    .returns([200, "[(:prdcl_title)]"]) \
  do
    handle_listing(PrdclTitle, params)
  end


  Endpoint.get('/prdcl_titles/:id')
    .description("Get a Periodical Title by ID")
    .params(["id", :id])
    .permissions([])
    .returns([200, "(:prdcl_title)"]) \
  do
    json_response(PrdclTitle.to_jsonmodel(params[:id]))
  end


  Endpoint.delete('/prdcl_titles/:id')
  .description("Delete a Periodical Title")
  .params(["id", :id])
  .permissions([:update_prdcl_title_record])
  .returns([200, :deleted]) \
  do
    handle_delete(PrdclTitle, params[:id])
  end

end
