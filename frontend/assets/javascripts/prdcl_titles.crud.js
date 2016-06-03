//= require form
$(function() {
     
  var init_prdcl_title_form = function(form) { 
    var $form = $(form); 
    
    var newSelector = "#prdcl_title";
    if ( $form.selector === '#new_prdcl_title_batch' ) { 
        newSelector = "#prdcl_title_batch"; 
    }
    
  };
  
  // This is for binding event to prdcl_links, which link prdcl_titles to
  // resources
  // this is also for init the form in modals 
  $(document).ready(function() { 
  
    // this inits the form in the new prdcl_title page
    if ( $('#new_prdcl_title').length > 0 ) {   
      init_prdcl_title_form($("#new_prdcl_title"));
    }   
    
    // this inits the form in the new prdcl_title batch page
    if ( $('#new_prdcl_title_batch').length > 0 ) {   
      init_prdcl_title_form($("#new_prdcl_title_batch"));
    }   
    
    // this init the form in the modal
    $(document).bind("loadedrecordform.aspace", function(event, $container) {
      init_prdcl_title_form(("#new_prdcl_title", $container) );
    }) 
    
    // this is for prdcl_link, which link resources to prdcl_titles  
    $(document).bind("subrecordcreated.aspace", function(event, object_name, subform) {
      if ( object_name === 'prdcl_link' ){
        // just in case..lets init the form 
        init_prdcl_title_form($(subform)); 
        
      }
    });

  });

});
