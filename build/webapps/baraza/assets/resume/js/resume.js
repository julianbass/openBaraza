let address = [];
let education = [];
let employment = [];
let skills = [];
let projects = [];
let referees = [];

let displayApplicant = function(applicant) {
	if (applicant.length > 0) {
		let applicantData = applicant.pop();
		for( let field of Object.keys(applicantData) ) {
			if(field == 'cv_data') {
				document.getElementById("cv_data_id").innerHTML = applicantData[field];
			} else {
				$("[name='"+field+"']").val(applicantData[field]);
				$("[data-display="+field+"]").html(applicantData[field]);
			}			
		}
		calculateProgress();
	}
};

let renderEducation = function() {
	let educationContainer = $('#educationContainer');
	let resumeContainer = $('#resumeEducation');
	let educationList = '';
	let resumeEducation = ''

	for (let i = 0; i < education.length; i++) {
		let object = education[i];

		let listHtml = '<div class="m-widget4__item">'+
			'<div class="m-widget4__info">'+
				'<span class="m-widget4__title">'+
				object['institution']+
				'</span><br> '+
				'<span class="m-widget4__sub">'+
				object['edu-from']+' - '+object['edu-to']+
				'</span>'+							 		 
			'</div>'+
			'<div class="m-widget4__ext">'+
				'<span class="m-widget4__sub">'+
				object['certification']+
				'</span>'+					 		 
			'</div>'+
			'<div class="m-widget4__ext m--align-right"> '+
				'<button onClick="editInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-edit" data-toggle="modal" data-target="#educationModal" data-value="'+i+'" data-array="education" title="Edit"><i class="la la-edit"></i></button> '+
                '<button onClick="removeInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-delete" data-id="'+object['education_id']+'" data-name="education_id" data-value="'+i+'" data-array="education" title="Delete"><i class="la la-trash"></i></button> '+
			'</div> '+
		'</div>';


		let resumeHtml = '<span class="m-widget4__sub">'+
			object['institution']+' ,'+object['certification']+', '+object['edu-from']+' - '+object['edu-to']+
			'</span><br>';

		educationList += listHtml;
		resumeEducation += resumeHtml;
	}


	educationContainer.html(educationList);
	resumeContainer.html(resumeEducation);
};

let renderEmployment = function() {
	let employmentContainer = $('#employmentContainer');
	let resumeContainer = $('#resumeEmployment');
	let employmentList = '';
	let resumeEmployment = ''

	for (let i = 0; i < employment.length; i++) {
		let object = employment[i];

		let listHtml = '<div class="m-widget4__item">'+
				'<div class="m-widget4__info">'+
					'<span class="m-widget4__title">'+
					object['employer']+
					'</span><br> '+
					'<span class="m-widget4__sub">'+
					object['emp-from']+' - '+object['emp-to']+
					'</span>'+							 		 
				'</div>'+
				'<div class="m-widget4__ext">'+
					'<span class="m-widget4__sub">'+
					object['position']+
					'</span>'+						 		 
				'</div>'+
				'<div class="m-widget4__ext m--align-right"> '+
				'<button onClick="editInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-edit" data-toggle="modal" data-target="#employmentModal" data-value="'+i+'" data-array="employment" title="Edit"><i class="la la-edit"></i></button> '+
                '<button onClick="removeInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-delete" data-id="'+object['employment_id']+'" data-name="employment_id" data-value="'+i+'" data-array="employment" title="Delete"><i class="la la-trash"></i></button> '+
			'</div> '+
			'</div>';


		let resumeHtml = '<span class="m-widget4__sub">'+
				object['employer']+', '+object['position']+', '+object['emp-from']+' - '+object['emp-to']+
				'</span><br>';

		employmentList += listHtml;
		resumeEmployment += resumeHtml;
	}


	employmentContainer.html(employmentList);
	resumeContainer.html(resumeEmployment);
};

let renderProjects = function() {
	let projectsContainer = $('#projectsContainer');
	let resumeContainer = $('#resumeProjects');
	let projectsList = '';
	let resumeProjects = ''

	for (let i = 0; i < projects.length; i++) {
		let object = projects[i];

		let listHtml = '<div class="m-widget4__item">'+
				'<div class="m-widget4__info">'+
					'<span class="m-widget4__title">'+
					object['project-name']+
					'</span>'+						 		 
				'</div>'+
				'<div class="m-widget4__ext">'+
					'<span class="m-widget4__sub">'+
					object['project-date']+
					'</span>'+						 		 
				'</div>'+
				'<div class="m-widget4__ext m--align-right"> '+
				'<button onClick="editInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-edit" data-toggle="modal" data-target="#projectsModal" data-value="'+i+'" data-array="projects" title="Edit"><i class="la la-edit"></i></button> '+
                '<button onClick="removeInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-delete" data-id="'+object['project_id']+'" data-name="project_id" data-value="'+i+'" data-array="projects" title="Delete"><i class="la la-trash"></i></button> '+
			'</div> '+
			'</div>';


		let resumeHtml = '<span class="m-widget4__sub">'+
			object['project-name']+', '+object['project-date']+
			'</span><br>';

		projectsList += listHtml;
		resumeProjects += resumeHtml;
	}


	projectsContainer.html(projectsList);
	resumeContainer.html(resumeProjects);
};

let renderReferees = function() {
	let refereesContainer = $('#refereesContainer');
	let resumeContainer = $('#resumeReferees');
	let refereesList = '';
	let resumeReferees = ''

	for (let i = 0; i < referees.length; i++) {
		let object = referees[i];

		let listHtml = '<div class="m-widget4__item">'+
				'<div class="m-widget4__info">'+
					'<span class="m-widget4__title">'+
					object['referee-name']+' | '+ object['referee-company']+
					'</span><br> '+
					'<span class="m-widget4__sub">'+
					object['referee-position']+
					'</span>'+							 		 
				'</div>'+
				'<div class="m-widget4__ext">'+
					'<span class="m-widget4__sub">'+
					object['referee-email']+
					'</span><br>'+
					'<span class="m-widget4__sub">'+
					object['referee-phone']+
					'</span>'+						 		 
				'</div>'+
				'<div class="m-widget4__ext m--align-right"> '+
				'<button onClick="editInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-edit" data-toggle="modal" data-target="#refereeModal" data-value="'+i+'" data-array="referees" title="Edit"><i class="la la-edit"></i></button> '+
                '<button onClick="removeInit(this);" class="m-portlet__nav-link btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill m-delete" data-id="'+object['referee_id']+'" data-name="referee_id" data-value="'+i+'" data-array="referees" title="Delete"><i class="la la-trash"></i></button> '+
			'</div> '+
			'</div>';


		let resumeHtml = '<span class="m-widget4__sub">'+
			object['referee-name']+' | '+ object['referee-company']+ ', '+object['referee-position']+', '+object['referee-email']+', '+object['referee-phone']+
			'</span><br>';

		refereesList += listHtml;
		resumeReferees += resumeHtml;
	}


	refereesContainer.html(refereesList);
	resumeContainer.html(resumeReferees);
};

let calculateProgress = function() {
	let progress = 0;

	let profile = $('#detailsForm').serializeArray();
	for (let field of profile) {
        if(field.value != "") {
        	progress += 2;
        }
    };

    if (education.length == 1) {
    	progress += 5;
    }else if(education.length == 2) {
    	progress += 10;
    } else if(education.length >= 3) {
    	progress += 15;
    }

    if (employment.length == 1) {
    	progress += 5;
    }else if (employment.length == 2) {
    	progress += 10;
    } else if (employment.length >= 3) {
    	progress += 15;
    }

    if (skills.length == 3) {
    	progress += 5;
    } else if (skills.length >= 4) {
    	progress += 10;
    }

    if (projects.length == 1 ) {
    	progress += 5;
    } else if (projects.length == 2) {
    	progress += 10;
    }else if (projects.length >= 3) {
    	progress += 15;
    }

    if (referees.length >= 1) {
    	progress += 10;
    }

    //console.log(progress);
    $('#progressText').html(progress+'% profile completeness');
    $('#progressBar').css("width", `${progress}%`);
};

let setRefereeArray = function(dataArray) {
	referees = dataArray;
	renderReferees();
};

let setEmploymentArray = function(dataArray) {
	employment = dataArray;
	renderEmployment();
};

let setEducationArray = function(dataArray) {
	education = dataArray;
	renderEducation();
};

let setProjectsArray = function(dataArray) {
	projects = dataArray;
	renderProjects();
};

let removeInit = function(e) {
	let objectIndex = $(e).attr('data-value');
	let arrayName = $(e).attr('data-array');

	let itemId = $(e).attr('data-id');
    let itemName = $(e).attr('data-name');
    let formData = {};
    formData[itemName] = itemId;
    let postUrl = null;

    switch (arrayName) {
		case 'education':
			education.splice(objectIndex, 1);
			renderEducation();
			postUrl = "resume?fnct=deleteEducation";
			break;
		case 'employment':
			employment.splice(objectIndex, 1);
			renderEmployment();
			postUrl = "resume?fnct=deleteEmployment";
			break;
		case 'projects':
			projects.splice(objectIndex, 1);
			renderProjects();
			postUrl = "resume?fnct=deleteProject";
			break;
		case 'referees':
			referees.splice(objectIndex, 1);
			renderReferees();
			postUrl = "resume?fnct=deleteReferee";
			break;
	}
	calculateProgress();

	sendAjax(postUrl, formData);
};

let editInit = function(e) {
	let modalID = $(e).attr('data-target');
	$(modalID).find(".save-btn").addClass('hidden');
	$(modalID).find(".upd-btn").removeClass('hidden');

	let objectIndex = $(e).attr('data-value');
	let arrayName = $(e).attr('data-array');
	let dataModal = $(e).closest('.modal');
	let object = {};

	switch (arrayName) {
		case 'education':
			object = education[objectIndex];
			break;
		case 'employment':
			object = employment[objectIndex];
			break;
		case 'projects':
			object = projects[objectIndex];
			break;
		case 'referees':
			object = referees[objectIndex];
			break;
	}

	for (let key of Object.keys(object)) {
		$('[name ="'+key+'"]').val(object[key]);
	}
};

$('.cancel-btn').on('click', function () {
	let modalId = $(this).attr('data-cancel');
	$('#'+modalId+' .m-input').val("");
	$('#'+modalId).modal('toggle');
});

function validate(form) {
	let valid = true;
	$.each(form, function (i, field) {
		$("[data-name='"+field.name+"']").removeClass('text-danger');
		if (field.value=="" && $("[name='"+field.name+"']").prop('required')) {
			valid = false;
			$("[name='"+field.name+"']").css({"border":"1px solid #ff000087"});
			$("[data-name='"+field.name+"']").addClass('text-danger');
		}
    });
    return valid;
}

function sendAjax(postUrl, formData) {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $.ajax({
        type: 'POST',
        url: postUrl,
        data: formData,
        dataType: 'json',
        success: function (mData) {
            //console.log(mData);
        },
        error: function (mData) {
            console.log("Error : ");
            console.log(mData);
        }
    });

};
