//= require search
$(function() {

  // this gets the publication information from the solr backend.
  // borrowed from the embedded_search js
  var init_prdcl_titleHoldingsSearch = function() {
    var $this = $(this);
    if ($(this).data("initialised")) return;

    $this.data("initialised", true);
   
    var resultsFormatter = function(json) {
     console.log(json); 
      return ;
    }
   
    $.getJSON($this.data('url'), function(json) {
      var output; 
      itemCount = json["search_data"]["total_hits"];
      if ( itemCount == 1 ) { 
          output = "1 related item."; 
       } else if (itemCount > 0 ) {
        output = itemCount + " related items.";  
      } else {
        output = "This publication is empty.";  
      } 
      $this.html("<span>" + output + "</span>"); 
    });
              
  };

  $(".prdcl_title-holdings").each(init_prdcl_titleHoldingsSearch);
  $(document).bind("loadedrecordform.aspace", function(event, $container) {
    $(".prdcl_title-holdings", $container).each(init_prdcl_titleHoldingsSearch);
  });

});
