ArchivesSpace::Application.routes.draw do

	match 'prdcl_titles/defaults' => 'prdcl_titles#defaults', :via => [:get]
    match 'prdcl_titles/defaults' => 'prdcl_titles#update_defaults', :via => [:post]
    resources :prdcl_titles
    match 'prdcl_titles/:id' => 'prdcl_titles#update', :via => [:post]
    match 'prdcl_titles/:id/delete' => 'prdcl_titles#delete', :via => [:post]
	
end
