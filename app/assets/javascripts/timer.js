$(document).ready(function(){
    if ($(".example").length){
         $(".example").TimeCircles({use_background:false, text_size: .15, time: {
            Days: {color:"#ffffff" },
            Hours: {color:"#ffffff"},
            Minutes: {color:"#ffffff"},
            Seconds: {color:"#ffffff"}
        }});
    }

    if($("#primary_search").length){
        $("#primary_search").TimeCircles({use_background:false, text_size: .15, time: {
            Days: {color:"#ffffff" },
            Hours: {color:"#ffffff"},
            Minutes: {color:"#ffffff"},
            Seconds: {color:"#ffffff"}
        }}).addListener(
            function(unit,value,total){
                // console.log(total);
                // console.log(ending);
                if (total % 10 == 0 ){

                    //alert("Primary search has not been completed");
                    //ajax call here to update when the timer restarted

                }
            }
        );

    }

    if($("#secondary_search").length){
    $("#secondary_search").TimeCircles({use_background:false, text_size: .15, time: {
        Days: {color:"#ffffff" },
        Hours: {color:"#ffffff"},
        Minutes: {color:"#ffffff"},
        Seconds: {color:"#ffffff"}
    }}).addListener(
        function(unit,value,total){
             console.log(total);

            if (total % 10 == 0){

               // $("#secondary_search").TimeCircles().restart();
                // alert("Secondary search has not been completed");
                // console.log("something");
                //ajax call here to update when the timer restarted

            }
        }
    );

}


    $("#task_primar_search").click(function(){
        if($(this).prop("checked")){
            $("#primary_search").TimeCircles().destroy();
        }
    });

    $("#task_secondary_search").click(function(){
        if($(this).prop("checked")){
            $("#secondary_search").TimeCircles().destroy();
        }

    });

    $("#endincidentbutton").click(function(e){
        e.preventDefault();
       var endincidentpath = $(this).attr("href");
       console.log(endincidentpath);


       $('.example').TimeCircles().destroy();
       window.location.href = endincidentpath;

    });



// 	$.ajax({
//         type: "GET",
//         dataType: "json",
//         url: "/timers/"+gon.incident.id,
//         success: function(data){


//         }
//     });

// function timerDone(name){
//         alert(name+" time has expired!");
//         // console.log("should be an alert");
//     }




});
