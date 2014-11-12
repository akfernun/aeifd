$(document).ready(function(){
    var ending = -15;

     $(".example").TimeCircles({use_background:false, text_size: .15, time: {
        Days: {color:"#ffffff" },
        Hours: {color:"#ffffff"},
        Minutes: {color:"#ffffff"},
        Seconds: {color:"#ffffff"}
    }}).addListener(
        function(unit,value,total){
            // console.log(total);
            // console.log(ending);
            if (total== ending){
                ending += -15;
                //alert("15 seconds have passed");

                //ajax call here to update when the timer restarted

            }
        }
    );



	$.ajax({
        type: "GET",
        dataType: "json",
        url: "/timers/"+gon.incident.id,
        success: function(data){
        	console.log(data);

        	var primary_search = new Date(data["primary_search"]);
        	var secondary_search = new Date(data["secondary_search"]);

            $("#primary_search").countdown({until: primary_search, format: "HMS", onExpiry:function(){timerDone("Primary Search")}});


            $("#secondary_search").countdown({until: secondary_search, format: "HMS", onExpiry:function(){timerDone("Secondary Search")}});


        }
    });

function timerDone(name){
        alert(name+" time has expired!");
        // console.log("should be an alert");
    }
});
