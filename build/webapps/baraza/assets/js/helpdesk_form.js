/**
 * Baraza java script call functions
 **/


$("#ptype_id").change(function (event) {
	var pTypeId = $("#ptype_id").val();

	if ((pTypeId !== null) && (pTypeId !== '')) {
		populateDefination(pTypeId, null);
	}
});

$("#pdefinition_id").change(function (event) {
	var pdefinition_id = $("#pdefinition_id").val();
	if ((pdefinition_id !== null) && (pdefinition_id !== '')) {
		populateEscalation(pdefinition_id, null);
	}
});

function populateDefination(pTypeId, selValue) {
    console.log("Type selected " + pTypeId);

    $("#pdefinition_id").empty().trigger('change');
    $("#pdefinition_id").select2({ placeholder: "Select an option", allowClear: true });

    let dataUrl = "jsondata?view=515:0:0&linkdata=" + pTypeId;

    $.ajax({
        type: 'GET',
        url: dataUrl,
        dataType: 'json',
        success: function(data) {
            console.log(data);
            
            var sel = -1;
            for(let i = 0; i < data.length; i++) {
                let jdd = data[i];
                var opt = new Option(jdd.pdefinition_name, jdd.pdefinition_id);
                $("#pdefinition_id").append(opt);
                if((selValue !== null) && (selValue === jdd.pdefinition_id)) sel = i;
            }
            
            if((selValue !== null) && (selValue !== '')) $("#pdefinition_id").val(selValue).trigger('change');
            else $("#pdefinition_id").val(null).trigger('change');
            
            if(sel >= 0) {
            	const selectElement = document.getElementById('pdefinition_id');
				selectElement.selectedIndex = sel;
			}
        }
    });
}

function populateEscalation(pdefinition_id, selValue) {
    console.log("Type selected " + pdefinition_id);

    $("#assigned_to").empty().trigger('change');
    $("#assigned_to").select2({ placeholder: "Select an option", allowClear: true });

    let dataUrl = "jsondata?view=515:0:0:0&linkdata=" + pdefinition_id;

    $.ajax({
        type: 'GET',
        url: dataUrl,
        dataType: 'json',
        success: function(data) {
            console.log(data);
            
            var sel = -1;
            for(let i = 0; i < data.length; i++) {
                let jdd = data[i];
                var opt = new Option(jdd.entity_name, jdd.entity_id);
                $("#assigned_to").append(opt);
            	if((selValue !== null) && (selValue === jdd.entity_id)) sel = i;
            }
            
            if((selValue !== null) && (selValue !== '')) $("#assigned_to").val(selValue).trigger('change');
            else $("#assigned_to").val(null).trigger('change');
            
            if(sel >= 0) {
            	const selectElement = document.getElementById('assigned_to');
				selectElement.selectedIndex = sel;
			}
        }
    });
}

function populateHelpdesk(keydata) {
	console.log("Populate helpdesk");
	
	if(keydata === '!new!') {
		var pTypeId = $("#ptype_id").val();
		populateDefination(pTypeId);
		
	} else if((keydata !== null) && (keydata !== '')) {
		console.log('Load form data');
		let dataUrl = "jsondata?view=485:0:0&linkdata=" + keydata;

		$.ajax({
		    type: 'GET',
		    url: dataUrl,
		    dataType: 'json',
		    success: function(data) {
		        console.log(data[0]);
		        
		        populateDefination(data[0].ptype_id, data[0].pdefinition_id);
		        $("#pdefinition_id").val = data[0].pdefinition_id; 
		        
		        populateEscalation(data[0].pdefinition_id, data[0].assigned_to);
		        $("#assigned_to").val = data[0].assigned_to; 
		    }
		});
    }    
}

$(document).ready(function(){
    let queryString = window.location.search;
    let urlParams = new URLSearchParams(queryString);
    let keydata = urlParams.get('data');
    console.log(keydata);

	populateHelpdesk(keydata);
	
});
    
    
    
