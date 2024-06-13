let eagleApi = function() {
    // Error Msg
    let ajaxMsg = [];
    ajaxMsg[1] = "Something Went Wrong! Contact Us as soon as possible.";

    // https://eagle.hcm.co.ke/hcmke/jsongeneral?xml=application.xml&view=20:0
    let fetchAllOrgsJobListUrl = "./jsongeneral?xml=application.xml&view=20:0"; // relevant
    // let fetchSingleJobDetailsUrl = "./jsongeneral?xml=application.xml&view=20:0:0&linkdata=";
    let fetchSingleJobDetailsUrl = "./jsongeneral?xml=application.xml&view=22:0:0:0&linkdata=";

    let fetchAllOrgs = "./jsongeneral?xml=application.xml&view=20:1";
    let fetchAllJobListingForSingleOrg = "./jsongeneral?xml=application.xml&view=20:1:0&linkdata=";
    let fetchJobDetailSingleOrg = "./jsongeneral?xml=application.xml&view=20:1:0:0&linkdata=";

    // let fetchEagleVacancies = "./jsongeneral?xml=application.xml&view=20:1:0&linkdata=401";
    let fetchEagleVacancies = "./jsongeneral?xml=application.xml&view=22:0:0&linkdata=401";

    const EmailNotFound = "Email found";
    const EmailNotFoundUserDisplay = "Complete security check. Kindly log in to your email to complete verification";
    const ApplicationAdded = "Application already added";
    const ApplicationAddedUserDisplay = "You have already applied for this position";


    /**
     * General Ajax
     * @param {*} method 
     * @param {*} url 
     * @param {*} jsonData 
     * @param {*} ajaxMsg 
     * @param {*} elemID 
     * @param {*} htmlMsg 
     */
    function ajaxCall(method, url, jsonData, ajaxMsg, elemID) {

        var msgHTML = "";
        if (method = 'POST') {
            $.ajax({
                type: method,
                url: url,
                data: jsonData,
                dataType: 'json',
                success: function(data) {

                    getAjaxData(data, url, elemID);

                    // window.location.href = '/dashboard';
                },
                error: function(data) {

                    msgHTML = '<div class="callout small-12 alert" role="alert">' +
                        ajaxMsg[1] +
                        '</div>';

                    $(elemID).html(msgHTML);
                    $('.shift-tb').hide();
                }
            });
        } else {
            $.ajax({
                type: method,
                url: url,
                dataType: 'json',
                success: function(data) {

                    getAjaxData(data, url, elemID);

                    // window.location.href = '/dashboard';
                },
                error: function(data) {

                    msgHTML = '<div class="callout small-12 alert" role="alert">' +
                        ajaxMsg[1] +
                        '</div>';

                    $(elemID).html(msgHTML);
                    $('.shift-tb').hide();
                }
            });
        }


    }

    /**
     * Filters Data
     * @param {*} data 
     */
    function getAjaxData(data, url, elemID) {
        // console.log("getAjaxData url+> " + url);

        let msgHTML = "";

        // switch (url) {

        //     case fetchEagleVacancies:
        //         jobListingTemplate(data, elemID);
        //         break;

        //     case fetchSingleJobDetailsUrl:
        //         singleJobDetails(data, elemID);
        //         break;

        //     default:
        //         text = "No value found";
        // }

        if (url == fetchEagleVacancies) {
            jobListingTemplate(data, elemID);
        } else if (url.includes(fetchSingleJobDetailsUrl)) {
            singleJobDetails(data, elemID);
        }
    }

    function jobListingTemplate(data, elemID) {
        console.log(data);
        let jLHtml = "";

        for (let i = 0; i < data.length; i++) {

            jLHtml += '<div class="result_job">' +
                '<div class="job_title">' +
                data[i].job_category_name +
                '</div>' +
                '<div class="job_category">' +
                data[i].location_name +
                '</div>' +
                '<div class="job_ref">' +
                'Closing Date : ' + data[i].closing_date +
                '</div>' +
                '<div class="job_action">' +
                '<a class="button hollow primary" href="./job_detail.jsp?link=' + data[i].KF + '">' +
                'VIEW JOB' +
                '</a>' +
                '</div>' +
                '</div>';
        }

        $(elemID).html(jLHtml);
    }

    function singleJobDetails(data, elemID) {
        console.log(data);
        let sJDHtml = "";

        for (let i = 0; i < data.length; i++) {
            $('.single_job_title').html(data[i].job_title);
            $('.single_job_title').css({ 'text-transform': 'uppercase' });

            $('.single_job_ref').html("Positions : " + data[i].positions);
            $('.single_job_location').html(data[i].location_name);
            $('.single_job_category').html(data[i].job_category_name);
            $('.single_job_details').html(data[i].job_description);
        }
    }

    function getCurrentUrlParameter() {
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        let linkId = urlParams.get('link');

        return linkId;
    }

    /**
     * 
     */
    let handleFetchAllJobListing = function() {
        // console.log('============= handleFetchAllJobListing =============');
        // GET Method
        ajaxCall('GET', fetchEagleVacancies, '', ajaxMsg, '.job_list');
    };

    /**
     * 
     */
    let handleSingleJobListing = function() {
        console.log('============= handleSingleJobListing =============');
        let linkId = getCurrentUrlParameter();
        let fetchUrl = fetchSingleJobDetailsUrl + linkId

        // GET Method
        ajaxCall('GET', fetchUrl, '', ajaxMsg, '.single_job_title');
    };

    /**
     * Function to post Job Application
     */
    let handleJobApplication = function(app_xml) {
        console.log('============= handleJobApplication =============');
        var msgHTML = "";
        $(".btn_application").click(function(e) {
            if (!validate($("#frm_application").serializeArray())) { return; }
            var form_data = JSON.stringify($("#frm_application").serializeArray());
            let applicant_email = $('#applicant_email').val();
            let job_id = $('#job_id').val();
            // console.log(form_data);
            $.post('ajaxinsert', { app_xml: app_xml, app_key: '1:0', form_data: form_data }, function(data) {
                console.log(data);

                if (data.error == 2) {
                    msgHTML = '<div class="callout small-12 alert" role="alert">';
                    msgHTML += 'Email Exists. No need for registration. Click on <b> Already Have An Account </b> tab to complete application.';
                    msgHTML += '</div>';
                } else {

                    // Get entity Id and send email
                    let search_url = "/hcmke/recruitment?tag=search_email&email=" + applicant_email;
                    // msgHTML = ''
                    $.post(search_url, {
                        form_data: applicant_email
                    }, function(data) {
                        console.log(data);
                        console.log("Successful Gotten Id");

                        // send email
                        let username = applicant_email;
                        let entityId = data.entityId;
                        // msgHTML = '';

                        let sendUrl = "/hcmke/recruitment?tag=apply_job&email=" + username + "&entity_id=" + entityId + "&intake_id=" + job_id;
                        let form_data = {
                            email: username,
                            entity_id: entityId,
                            intake_id: job_id
                        };

                        $.post(sendUrl, { apply_job: form_data }, function(data) {

                            if (data.success == 1) {
                                msgHTML = '<div data-alert class="callout small-12 primary">';
                                msgHTML += 'Check your email and click on the link to complete application.';
                                msgHTML += '</div>';

                            } else {
                                msgHTML = '<div class="callout small-12 primary" role="alert">';
                                msgHTML += data.message;
                                msgHTML += '</div>';
                            }

                            console.log("Link Sent Successfully!");

                            $('#frmRegApplicantAlert').html(msgHTML);

                            // disable buttons
                            $(".btn_sign_in").attr("disabled", true);
                            $(".btn_application").attr("disabled", true);

                        });
                        // End Send Email

                    }).fail(function(jqXHR, textStatus, errorThrown) {

                        if (jqXHR.status == 404) {
                            console.log('40000000000000000004');
                        }
                    });
                    // End Get entity Id and send email
                }
                $('#frmRegApplicantAlert').html(msgHTML);
            });




        });

    };

    function getEntityId(email) {

        let search_url = "/hcmke/recruitment?tag=search_email&email=" + email;
        let msgHTML = ''

        $.post(search_url, {
            form_data: email
        }, function(data) {
            console.log(data);

            if (data.success == 1) {
                msgHTML = '<div data-alert class="callout small-12 warning">';
                msgHTML += 'Email Exists. No need for registration. Click on <b> Already Have An Account </b> tab to complete application.';
                msgHTML += '</div>';

                // set value
                $("#entityId").val(data.entityId);
                // set email to already exists tab
                $("#email").val(email);

            } else {
                msgHTML = '<div class="callout small-12 primary" role="alert">';
                msgHTML += data.message
                msgHTML += '</div>';
            }
            $('#frmRegApplicantAlert').html(msgHTML);
        }).fail(function(jqXHR, textStatus, errorThrown) {

            if (jqXHR.status == 404) {
                console.log('40000000000000000004');
            }
        });

    }

    function validate(form) {
        let valid = true;
        $.each(form, function(i, field) {
            $("[name='" + field.name + "']").prev('.text-danger').remove();
            if (field.value == "" && $("[name='" + field.name + "']").prop('required')) {
                valid = false;
                $("[name='" + field.name + "']").css({ "border": "1px solid #ff000087" });
                $("[name='" + field.name + "']").before('<span class="text-danger">This field is required *</span>');
            }
            if (!validateEmail(field.value) && $("[name='" + field.name + "']").prop('email')) {
                valid = false;
                $("[name='" + field.name + "']").css({ "border": "1px solid #ff000087" });
                $("[name='" + field.name + "']").before('<span class="text-danger">Enter a valid email address</span>');
            }
        });
        return valid;
    }

    function confirmEmail() {
        $("#confirm_email").prev('.text-danger').remove();
        if ($("#primary_email").val() != $("#confirm_email").val()) {
            $("#confirm_email").css({ "border": "1px solid #ff000087" });
            $("#confirm_email").before('<span class="text-danger">Emails do not match</span>');
            return false;
        } else return true;
    }

    /**
     * Valida Email Field
     * @param {*} email 
     */
    function validateEmail(email) {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    function handleLiveEmailSearch() {
        console.log('============= handleLiveEmailSearch =============');
        //setup before functions
        let typingTimer; //timer identifier
        let doneTypingInterval = 4000; //time in ms, 3 second for example
        let $input = $('#applicant_email');

        //on keyup, start the countdown
        $input.on('keyup', function() {
            clearTimeout(typingTimer);
            typingTimer = setTimeout(doneTyping, doneTypingInterval);
        });

        //on keydown, clear the countdown 
        $input.on('keydown', function() {
            // console.log("Key Down typing... ");
            clearTimeout(typingTimer);
        });

    }

    //user is "finished typing," do something
    function doneTyping() {
        let $input = $('#applicant_email');
        //do something
        // console.log("DOne typing... ");
        let email = $input.val();
        // console.log("Key Up typing... " + email);

        // only send if its a valid email
        if (validateEmail(email)) {

            // let search_url = "?tag=search_email&email=" + email;
            let search_url = "/hcmke/recruitment?tag=search_email&email=" + email;
            let msgHTML = ''

            $.post(search_url, {
                form_data: email
            }, function(data) {
                console.log(data);

                if (data.success == 1) {
                    msgHTML = '<div data-alert class="callout small-12 warning">';
                    msgHTML += 'Email Exists. No need for registration. Click on <b> Already Have An Account </b> tab to complete application.';
                    msgHTML += '</div>';

                    // set value
                    $("#entityId").val(data.entityId);
                    // set email to already exists tab
                    $("#email").val(email);

                }
                // else {
                //     msgHTML = '<div class="callout small-12 primary" role="alert">';
                //     msgHTML += data.message
                //     msgHTML += '</div>';
                // }
                $('#frmRegApplicantAlert').html(msgHTML);
            }).fail(function(jqXHR, textStatus, errorThrown) {

                if (jqXHR.status == 404) {
                    console.log('40000000000000000004');
                }
            });
        }
    }

    function handleSendApplicantLink(job_id) {
        console.log('============= handleSendApplicantLink =============');
        // Send Link 
        $('.btn_sign_in').click(function(event) {
            event.preventDefault();

            // set the 
            let username = $("#email").val();
            // let entityId = $('#entityId').val();
            let entityId = '';
            let search_url = "/hcmke/recruitment?tag=search_email&email=" + username;

            let msgHTML = '';
            let userMessage = '';
            if (validateEmail(username)) {
                
                $.post(search_url, {
                    form_data: username
                }, function(data) {
                    console.log(data);
        
                    if (data.success == 1) {
                        // set entity ID
                        entityId = data.entityId;
                        let sendUrl = "/hcmke/recruitment?tag=apply_job&email=" + username + "&entity_id=" + entityId + "&intake_id=" + job_id;
                      

                        let form_data = {
                            email: username,
                            entity_id: entityId,
                            intake_id: job_id
                        };
        
                        $.post(sendUrl, { apply_job: form_data }, function(data) {

                            let respMessage = data.message;
        
                            if (data.success == 1) {

                                if( respMessage == ApplicationAdded){
                                    userMessage = ApplicationAddedUserDisplay;
                                }else if( respMessage == EmailNotFound){
                                    userMessage = EmailNotFoundUserDisplay;
                                }else{
                                    userMessage = respMessage;
                                }
                                msgHTML = '<div data-alert class="callout small-12 primary">';
                                msgHTML += userMessage;
                                msgHTML += '</div>';
        
                            } else {
                                msgHTML = '<div class="callout small-12 primary" role="alert">';
                                msgHTML += data.message;
                                msgHTML += '</div>';
                            }
    
        
                            // disable buttons
                            $(".btn_sign_in").attr("disabled", true);
                            $(".btn_application").attr("disabled", true);

                            $('#frmSignAlert').html(msgHTML);
        
                        });
                    }else{
                        msgHTML = '<div class="callout small-12 primary" role="alert">';
                        msgHTML += data.message += '. Please Click on <b>Registration & Apply</b> Tab to complete the application.';
                        msgHTML += '</div>';
                    
                        $('#frmSignAlert').html(msgHTML);
                    }
        
                    $('#frmSignAlert').html(msgHTML);

                }).fail(function(jqXHR, textStatus, errorThrown) {
        
                   
                });


            } else {
                msgHTML = '<div class="callout small-12 alert" role="alert">';
                msgHTML += 'Invalid Email Address';
                msgHTML += '</div>';

                $('#frmSignAlert').html(msgHTML);
            }

        });
    }



    return {
        //main function to initiate the theme
        init: function(Args) {
            args = Args;
            let app_xml = 'application.xml';
            handleFetchAllJobListing();
            handleSingleJobListing();
            handleJobApplication(app_xml);
            handleSendApplicantLink(args[0]);
            handleLiveEmailSearch(args[0]);

        }
    }


}();