$(document).ready(function(){

     $(".example").TimeCircles({use_background:false, text_size: .15, time: {
        Days: {color:"#ffffff" },
        Hours: {color:"#ffffff"},
        Minutes: {color:"#ffffff"},
        Seconds: {color:"#ffffff"},
    }});



	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/timers/"+gon.incident.id,
        success: function(data){
        	console.log(data);

        	var all_clear = new Date(data["all_clear"]);
        	var primary_search = new Date(data["primary_search"]);
        	var utilities_contacted = new Date(data["utilities_contacted"]);
        	var safety_officer_arrived = new Date(data["safety_officer_arrived"]);
        	var utilities_disconnected = new Date(data["utilities_disconnected"]);
        	var secondary_search = new Date(data["secondary_search"]);
        	var fire_under_control = new Date(data["fire_under_control"]);

            $("#all_clear").countdown({until: all_clear, format: "HMS", onExpiry:function(){timerDone("All Clear")}});

            $("#primary_search").countdown({until: primary_search, format: "HMS", onExpiry:function(){timerDone("Primary Search")}});

            $("#utilities_contacted").countdown({until: utilities_contacted, format: "HMS", onExpiry:function(){timerDone("Utilities Contacted")}});

            $("#safety_officer_arrived").countdown({until: safety_officer_arrived, format: "HMS", onExpiry:function(){timerDone("Safety Officer Arrived")}});

            $("#utilities_disconnected").countdown({until: utilities_disconnected, format: "HMS", onExpiry:function(){timerDone("Utilities Disconnected")}});

            $("#secondary_search").countdown({until: secondary_search, format: "HMS", onExpiry:function(){timerDone("Secondary Search")}});

            $("#fire_under_control").countdown({until: fire_under_control, format: "HMS", onExpiry:function(){timerDone("Fire Under Control")}});

        }
    });

function timerDone(name){
        alert(name+" time has expired!");
        // console.log("should be an alert");
    }
});
