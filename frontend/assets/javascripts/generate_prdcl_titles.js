$( document ).ready(function() {
	$("#digital_object_prdcls__0__prdcl_links__0__ref_").on('keyup change', prdcl_link);
	$("#digital_object_prdcls__0__volume_num_").on('keyup change', prdcl_link);
	$("#digital_object_prdcls__0__issue_num_").on('keyup change', prdcl_link);

    function prdcl_link(){
		var valp = {};
		valp = $("#digital_object_prdcls__0__prdcl_links__0__ref_").data('selected');
		//console.log(valp);
        var valv = $("#digital_object_prdcls__0__volume_num_").val();
        var vali = $("#digital_object_prdcls__0__issue_num_").val();
		
		var res;
		var pub;
		var vol;
		var iss;
		
		if (valp!=""){
			pub = valp['title'];
			res = pub;
        }
		if (valv!=""){
			vol = " - Volume " + valv;
			res = res.concat(vol);
        }
		if (vali!=""){
			if (valv!=""){
				iss = ", Issue " + vali;
			}
			else {
				iss = " - Issue " + vali;
			}
			res = res.concat(iss);
        }

		$("#digital_object_title_").val(res);
   };
});