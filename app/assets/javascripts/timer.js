$(document).ready(function(){

	function timerDone(){
		alert(" is done!");
	}

	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/timers/",
        success: function(data){
        	//console.log(data[data.length - 1]["all_clear"]);

        	var all_clear = new Date(data[data.length - 1]["all_clear"]);
        	var primary_search = new Date(data[data.length - 1]["primary_search"]);
        	var utilities_contacted = new Date(data[data.length - 1]["utilities_contacted"]);
        	var safety_officer_arrived = new Date(data[data.length - 1]["safety_officer_arrived"]);
        	var utilities_disconnected = new Date(data[data.length - 1]["utilities_disconnected"]);
        	var secondary_search = new Date(data[data.length - 1]["secondary_search"]);
        	var fire_under_control = new Date(data[data.length - 1]["fire_under_control"]);

        	$('#all_clear').countdown({until: all_clear , format:'HMS', onExpiry:timerDone });
        	$('#primary_search').countdown({until: primary_search , format:'HMS', onExpiry:timerDone });
        	$('#utilities_contacted').countdown({until: utilities_contacted , format:'HMS', onExpiry:timerDone });
        	$('#utilities_disconnected').countdown({until: utilities_disconnected , format:'HMS', onExpiry:timerDone });
        	$('#secondary_search').countdown({until: secondary_search , format:'HMS', onExpiry:timerDone });
        	$('#fire_under_control').countdown({until: fire_under_control , format:'HMS', onExpiry:timerDone });
        	$('#safety_officer_arrived').countdown({until: safety_officer_arrived , format:'HMS', onExpiry:timerDone });

        }
    });

});
