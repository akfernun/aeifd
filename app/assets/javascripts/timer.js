$(document).ready(function(){

	function timerDone(){
		alert(" is done!");
		console.log("should be an alert");
	}


	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/timers/"+gon.incident.id,
        success: function(data){
        	console.log("hit ajax function");

        	var all_clear = new Date(data["all_clear"]);
        	var primary_search = new Date(data["primary_search"]);
        	var utilities_contacted = new Date(data["utilities_contacted"]);
        	var safety_officer_arrived = new Date(data["safety_officer_arrived"]);
        	var utilities_disconnected = new Date(data["utilities_disconnected"]);
        	var secondary_search = new Date(data["secondary_search"]);
        	var fire_under_control = new Date(data["fire_under_control"]);

        	var myArray = {"all_clear":all_clear,"primary_search":primary_search,"utilities_contacted":utilities_contacted,"safety_officer_arrived":safety_officer_arrived,"utilities_disconnected":utilities_disconnected,"secondary_search":secondary_search, "fire_under_control":fire_under_control};

        	console.log("something is running");

        	for (var key in myArray) {
        		if(myArray[key] > Date.now()){
        		 var jf = $('#'+key).countdown({until: myArray[key] , format:'HMS', onExpiry:timerDone});
        		 //console.log(jf);
        		}
			}





        	// $('#all_clear').countdown({until: all_clear , format:'HMS', onExpiry:timerDone });
        	// $('#primary_search').countdown({until: primary_search , format:'HMS', onExpiry:timerDone });
        	// $('#utilities_contacted').countdown({until: utilities_contacted , format:'HMS', onExpiry:timerDone });
        	// $('#utilities_disconnected').countdown({until: utilities_disconnected , format:'HMS', onExpiry:timerDone });
        	// $('#secondary_search').countdown({until: secondary_search , format:'HMS', onExpiry:timerDone });
        	// $('#fire_under_control').countdown({until: fire_under_control , format:'HMS', onExpiry:timerDone });
        	// $('#safety_officer_arrived').countdown({until: safety_officer_arrived , format:'HMS', onExpiry:timerDone });

        }
    });





});
