
    <div class="modal fade" id="approval_modal" tabindex="-1" role="basic" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title"><i class="fa fa-unlock-alt" style="color:#3598dc; font-size:24px"></i> Approval Notes</h4>
                </div>
                <form class="form-horizontal" action="#">
                <div class="modal-body">
                    <div id="approve_alert_div"></div>
                    
                    <div class='row'>
						<div class='form-group'>
							<label class=" col-md-3 control-label" for="txt_approval_details">Notes</label>
							<div class='col-md-9'>
								<textarea name='txt_approval_details' id="txt_approval_details" class='form-control' cols='50' rows='10'><%=web.getApprovalItem("details")%></textarea>
							</div>
						</div>
					</div>
						
					<div class='row' id="div_review_advice">
						<div class='form-group'>
							<label class=" col-md-3 control-label" for="txt_review_advice">Review Advice</label>
							<div class='col-md-9'>
								<textarea name='txt_review_advice' id="txt_review_advice" class='form-control' cols='50' rows='10'><%=web.getApprovalItem("review_advice")%></textarea>
							</div>
						</div>
					</div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn green-haze" id="btnApprovalModal">Proceed</button>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


<script type="text/javascript">
	$('#btnApprovalModal').click(function(){
		console.log('Approval form');
		console.log(approveOperation);
		
		var approvalDetails = $('#txt_approval_details').val();
    	var reviewAdvice = $('#txt_review_advice').val();
    	var ok = true;
    	
    	if(approvalDetails === '' || approvalDetails == null){
        	runAlert('Enter approval notes', 'danger', 'warning'); 
        	ok = false;  
        	$('#txt_approval_details').focus(); 
        	return false;
    	}
    
    	if(approveOperation == '2') {
			if(reviewAdvice === '' || reviewAdvice == null){
				runAlert('Enter review advice', 'danger', 'warning'); 
				ok = false; 
				$('#txt_review_advice').focus(); 
				return false;
			}
		}
		
    	if(ok) {
			$.post("ajax", {fnct:'approval', id:approveOperation, details:approvalDetails, review_advice:reviewAdvice}, function(data) {
			    if(data.error == true){
			        toastr['error'](data.msg, "Error");
			    } else if(data.error == false) {
			        toastr['success'](data.msg, "Ok");
			        
			        $(".btnApprovalForm").prop('disabled', true);
			    }
			    $('.modal').modal('hide');
			}, "JSON");
    	}
	});
	
	function runAlert(msg, type, icon){
		Metronic.alert({
            container: '#approve_alert_div', // alerts parent container(by default placed after the page breadcrumbs)
            place: 'append', // append or prepent in container 
            type: type,  // alert's type
            message: msg,  // alert's message
            close: true, // make alert closable
            reset: true, // close all previouse alerts first
            focus: false, // auto scroll to the alert after shown
            closeInSeconds: 0, // auto close after defined seconds
            icon: icon // put icon before the message
        });
	}
</script>

