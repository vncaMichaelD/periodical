class PrdclTitlesController < ApplicationController

  set_access_control  "view_repository" => [:index, :show],
                      "update_prdcl_title_record" => [:new, :edit, :create, :update, :delete],
                      "manage_repository" => [:defaults, :update_defaults]

  FACETS = []

  def self.FACETS
    FACETS
  end

  def index
    @search_data = Search.for_type(session[:repo_id], "prdcl_title", params_for_backend_search.merge({"facet[]" => FACETS}))
  end


  def get_prdcl_title
    @prdcl_title = JSONModel(:prdcl_title).find(params[:id])
  end

  def show
    get_prdcl_title
  end

  def new
    prdcl_title_params = params.inject({}) { |c, (k,v)| c[k] = v ; c }
    @prdcl_title = JSONModel(:prdcl_title).new(prdcl_title_params)._always_valid!

    if user_prefs['default_values']
      defaults = DefaultValues.get 'prdcl_title'

      @prdcl_title.update(defaults.values) if defaults
    end


    render_aspace_partial :partial => "prdcl_titles/new" if inline?
  end

  def edit
    get_prdcl_title
  end

  def create
    handle_crud(:instance => :prdcl_title,
                :model => JSONModel(:prdcl_title),
                :on_invalid => ->(){
                  return render_aspace_partial :partial => "prdcl_titles/new" if inline?
                  return render :action => :new
                },
                :on_valid => ->(id){
                  return render :json => @prdcl_title.to_hash if inline?

                  flash[:success] = I18n.t("prdcl_title._frontend.messages.created")
                  if params.has_key?(:plus_one)
                     sticky_params = { :controller => :prdcl_titles, :action => :new}
                     @prdcl_title.to_hash.each_pair do |k,v|
                        sticky_params[k] = v if LOCATION_STICKY_PARAMS.include?(k)
                     end

                     return redirect_to sticky_params
                  end
                  redirect_to :controller => :prdcl_titles, :action => :edit, :id => id
                })
  end

  def update
    handle_crud(:instance => :prdcl_title,
                :model => JSONModel(:prdcl_title),
                :obj => JSONModel(:prdcl_title).find(params[:id]),
                :on_invalid => ->(){ return render :action => :edit },
                :on_valid => ->(id){
                  flash[:success] = I18n.t("prdcl_title._frontend.messages.updated")
                  redirect_to :controller => :prdcl_titles, :action => :edit, :id => id
                })
  end

  def defaults
    defaults = DefaultValues.get 'prdcl_title'

    values = defaults ? defaults.form_values : {}

    @prdcl_title = JSONModel(:prdcl_title).new(values)._always_valid!

    render "defaults"
  end

  def update_defaults

    begin
      DefaultValues.from_hash({
                                "record_type" => "prdcl_title",
                                "lock_version" => params[:prdcl_title].delete('lock_version'),
                                "defaults" => cleanup_params_for_schema(
                                                                        params[:prdcl_title],
                                                                        JSONModel(:prdcl_title).schema)
                              }).save

      flash[:success] = I18n.t("default_values.messages.defaults_updated")
      redirect_to :controller => :prdcl_titles, :action => :defaults
    rescue Exception => e
      flash[:error] = e.message
      redirect_to :controller => :prdcl_titles, :action => :defaults
    end
  end

  def batch
    @is_batch_update = false
    @action = "create" # we use this for some label in the view..

    if request.post? # if it's a post, we're starting an update
      @is_batch_update = true
      @action = "update" # we use this for some label in the view..
      @prdcl_title_batch = JSONModel(:prdcl_title_batch_update).new(params)._always_valid!
    else # we're just creatinga new batch from scratch
      prdcl_title_params = params.inject({}) { |c, (k,v)| c[k] = v if LOCATION_STICKY_PARAMS.include?(k); c }
      @prdcl_title_batch = JSONModel(:prdcl_title_batch).new(prdcl_title_params)
    end
  end



  def batch_create

    begin
      if params[:prdcl_title_batch][:record_uris] && params[:prdcl_title_batch][:record_uris].length > 0
        batch = cleanup_params_for_schema(params[:prdcl_title_batch], JSONModel(:prdcl_title_batch_update).schema)
        @prdcl_title_batch = JSONModel(:prdcl_title_batch_update).from_hash(batch, false)._always_valid!

        uri = "#{JSONModel::HTTP.backend_url}/prdcl_titles/batch_update"
        response = JSONModel::HTTP.post_json(URI(uri), batch.to_json)

        batch_response = ASUtils.json_parse(response.body)
      else

        batch = cleanup_params_for_schema(params[:prdcl_title_batch], JSONModel(:prdcl_title_batch).schema)

        @prdcl_title_batch = JSONModel(:prdcl_title_batch).from_hash(batch, false)

        uri = "#{JSONModel::HTTP.backend_url}/prdcl_titles/batch"
        if params["dry_run"]
          uri += "?dry_run=true"
        end
        response = JSONModel::HTTP.post_json(URI(uri), batch.to_json)

        batch_response = ASUtils.json_parse(response.body)
      end

      if batch_response.kind_of?(Hash) and batch_response.has_key?("error")
        if params["dry_run"]
          return render_aspace_partial :partial => "shared/quick_messages", :locals => {:exceptions => batch_response, :jsonmodel => "prdcl_title_batch"}
        else
          @exceptions = {:errors => batch_response["error"]}

          return render :action => :batch
        end
      end

      if params["dry_run"]
        render_aspace_partial :partial => "prdcl_titles/batch_preview", :locals => {:prdcl_titles => batch_response}
      else

        # we want 'created' or 'updated' messages displayed
        if @prdcl_title_batch.jsonmodel_type == "prdcl_title_batch_update"
          flash[:success] = I18n.t("prdcl_title_batch._frontend.messages.updated", :number_created => batch_response.length)
        else
          flash[:success] = I18n.t("prdcl_title_batch._frontend.messages.created", :number_created => batch_response.length)
        end

        if params.has_key?(:plus_one)
           sticky_params = { :controller => :prdcl_titles, :action => :batch}
           @prdcl_title_batch.to_hash.each_pair do |k,v|
              sticky_params[k] = v if LOCATION_STICKY_PARAMS.include?(k)
           end

           return redirect_to sticky_params
        end
        redirect_to :action => :index
      end
    rescue JSONModel::ValidationException => e
      @exceptions = @prdcl_title_batch._exceptions

      return render :action => :batch
    end
  end

  def delete
    prdcl_title = JSONModel(:prdcl_title).find(params[:id])
    begin
      prdcl_title.delete
    rescue ConflictException => e
      flash[:error] = prdcl_title.translate_exception_message(e.conflicts)
      return redirect_to(:controller => :prdcl_titles, :action => :show, :id => prdcl_title.id)
    end

    flash[:success] = I18n.t("prdcl_title._frontend.messages.deleted", JSONModelI18nWrapper.new(:prdcl_title => prdcl_title))
    redirect_to(:controller => :prdcl_titles, :action => :index, :deleted_uri => prdcl_title.uri)
  end

end
