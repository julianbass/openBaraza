<script>
	toastr.options = {
		"closeButton": true,
		"debug": false,
		"positionClass": "toast-top-right",
		"onclick": null,

		"showDuration": "1000",
		"hideDuration": "1000",
		"timeOut": "5000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "fadeIn",
		"hideMethod": "fadeOut"
	}

	var attendanceList = <%=web.getDashboardItem("accessLog")%>;

	var timeSheet = <%=web.getDashboardItem("timeSheet")%>;

	var btnLunch = $(".lunch-break-btn");
	var btnLunchOut = $(".lunch-break-out-btn");
	var btnBreak = $(".break-btn");
	var btnBreakOut = $(".break-out-btn");
	var btnClockIn = $(".clock-in-btn");
	var btnClockOut = $(".clock-out-btn");
	//landing page when the array is null disable lunch and break buttons
	if(attendanceList.length < 1){
		btnLunch.attr('disabled','disabled');//if clocked in activate lunch button
		btnBreak.attr('disabled','disabled');//if clocked in activate break button
		btnClockIn.show();//hide clocin in button
		btnClockOut.hide();//show clock out button
		btnLunchOut.hide();//hide the lunchout button
		btnBreakOut.hide();

		var d = new Date();
		var hr = d.getHours();
		var min = d.getMinutes();
		var ampm = "am";
		if( hr > 12 ) {
			hr -= 12;
			ampm = "pm";
		}
		btnClock = $(".clock-in-btn");
		btnClockStatus = $(".clock-in-status-btn");
		colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
			btnClockStatus, btnaddClass, labeladdClass, "CLOCK IN", "Current Time : " + hr + ":" + min + " " + ampm);
	}


	for(var key in attendanceList) {
		var log_type = attendanceList[key].log_type;
		var log_time_out = attendanceList[key].log_time_out;
		var log_time_in = attendanceList[key].log_time;

		<%--CLOCK IN--%>
		if((log_type == 1) || (log_type == 12)) {
			 btnClock = $(".clock-in-btn");
			 btnClockStatus = $(".clock-in-status-btn");
			//If clock in is set retain status activate break and lunch buttons
			if(log_time_in != "" && log_time_out == ""){
				<%--btnClock.removeAttr("disabled");--%>
				btnLunch.removeAttr('disabled');//if clocked in activate lunch button
				btnBreak.removeAttr('disabled');//if clocked in activate break button
				btnClockIn.hide();//hide clocin in button
				btnClockOut.show();//show clock out button
				btnLunchOut.hide();//hide the lunchout button
				btnBreakOut.hide();//hide the breakout button
				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
					btnClockStatus, btnaddClass, labeladdClass, "CLOCK OUT", "Clocked In :"+attendanceList[key].log_time);
			}
			//If the day is done disable the button
			if(log_time_in != "" && log_time_out != ""){
				//hide all in buttons
				btnClockIn.hide();
				btnLunch.hide();
				btnBreak.hide();
				btnLunchOut.html('LUNCH DONE');
				btnBreakOut.html('BREAK DONE');

				//disable all clockout buttons
				btnClockOut.attr('disabled','disabled');
				btnLunchOut.attr('disabled','disabled');
				btnBreakOut.attr('disabled','disabled');
				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
				btnClockStatus, btnaddClass, labeladdClass, "DONE CLOCKING", "Clocked Out :"+attendanceList[key].log_time_out);
			}
		}

		<%--LUNCH--%>
		if(log_type == 4){
			 btnClock = $(".lunch-break-btn");
			 btnClockStatus = $(".lunch-break-status-btn");
			//if lunch has started, disable clock out and break start button
			if(log_time_in != "" && log_time_out == ""){
		        //disable break in/out and disable clock out
		        btnClockOut.attr('disabled','disabled');
		        btnBreak.attr('disabled','disabled');


		        //hide the clock in and lunch in show lunch out
		        btnClockIn.hide();
		        btnLunch.hide();
		        btnLunchOut.show();
				//btnBreakOut.hide();//hide the breakout button

				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
				btnClockStatus, btnaddClass, labeladdClass, "LUNCH OUT", "Lunch Start :"+ attendanceList[key].log_time);
			}
			
			if(log_time_in != "" && log_time_out != ""){
		        //enable break in/out and enable clock out
		        btnClockOut.removeAttr('disabled');
		        btnBreak.removeAttr('disabled');

				//DIsable lunch button
				btnLunch.attr('disabled','disabled');
				btnLunchOut.attr('disabled','disabled');


		        //hide the clock in and lunch in show lunch out
		        <%--btnClockOut.hide();--%>
		       // btnLunch.hide();
		       // btnLunchOut.show();
				//btnBreakOut.hide();//hide the breakout button

				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
				btnClockStatus, btnaddClass, labeladdClass, "LUNCH DONE", "Lunch End "+ attendanceList[key].log_time_out);
			}
		}

		<%--BREAK--%>
		if(log_type == 7){
			 btnClock = $(".break-btn");
			 btnClockStatus = $(".break-status-btn");

			if(log_time_in  != "" && log_time_out == ""){
				//Disable Clock out and lunch out
				btnClockOut.attr('disabled','disabled');
				btnLunchOut.attr('disabled','disabled');
				btnLunch.attr('disabled','disabled');

				//hide break in,hide lunchin clock in show breakout
				btnBreak.hide();
				btnBreakOut.show();
				<%--btnLunch.hide();--%>
				btnLunchOut.hide();
				btnClockIn.hide();

				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
				btnClockStatus, btnaddClass, labeladdClass, "BREAK OUT", "Break Start :"+attendanceList[key].log_time);

			}

			if(log_time_in != "" && log_time_out != ""){
				//Enable Clock out and disable break
				btnClockOut.removeAttr('disabled','disabled');
				<%--btnBreakOut.attr('disabled','disabled');--%>

				//hide break in,hide lunchin clock in show breakout
				btnBreak.show();
				btnBreakOut.hide();
				<%--btnLunch.hide();--%>
				<%--btnLunchOut.show();--%>
				btnClockIn.hide();

				colorChange(btnClock, btnClockStatus, btnClock, btnrmvClass, labelrmvClass,
				btnClockStatus, btnrmvClass, labeladdClass, "BREAK", "Break End :"+attendanceList[key].log_time_out);
			}
		}
	}

	//Task
	if(timeSheet.length > 0){
		$('.task-manage-form').hide();
		$("#tsk_name").html(timeSheet[0].task_name);
		$("#end_task").val(timeSheet[0].timesheet_id);

	}else{
		$('#display-task').hide();

	}
	console.log(timeSheet);
</script>
