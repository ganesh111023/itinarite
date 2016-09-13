  $(document).ready(function () {
    //Add input box to the trip event
    $("#addmorning").on("click",function(){
        addMorningRow(".morning-activities:last",".morning-activities:last" );
        $('#removemorning').fadeIn();
    });
    $("#addafternoon").click(function(){
        addAfternoonRow(".afternoon:last",".afternoon:last" );
        $('#removeafternoon').fadeIn();
    });
    $("#addevening").click(function(){
        addEveningRow(".evening:last",".evening:last" );
        $('#removeevening').fadeIn();
    });

    //Remoe input box from the event
    $("#removemorning").click(function(){
        removeRow(".morning-activities:last",".add_morning");
        var size = $('.clone').length;

         //hide remove button when div count = 1
         if (size == 1) {
            $('#removemorning').fadeOut();
        }
    });
    $("#removeafternoon").click(function(){

        removeRow(".afternoon:last",".add_afternoon_div");
        var size = $('.afternoon').length;

         //hide remove button when div count = 1
         if (size == 1) {
            $('#removeafternoon').fadeOut();
        }
    });
    $("#removeevening").click(function(){
        removeRow(".evening:last",".add_evening_div");
        var size = $('.evening').length;

         //hide remove button when div count = 1
         if (size == 1) {
            $('#removeevening').fadeOut();
        }
    });

      function addMorningRow(current,beforeAdd){

        // var id = $(current).find('.trip-morning-place').attr('id');
        // var name = $(current).find('.trip-morning-place').attr('name');
        var appendDiv = $(current).clone();

        var index = Math.floor(100000 + Math.random() * 900000);
        appendDiv.find(".trip-morning-place").attr("name",'trip[trip_activities_attributes]['+index+'][place]');
        appendDiv.find(".trip-morning-place").attr("id", 'trip_trip_activities_attributes_'+index+'_place');

        appendDiv.find(".trip-morning-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
        appendDiv.find(".trip-morning-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');

        appendDiv.find(".trip-morning-photo").attr("name",'trip[trip_activities_attributes]['+index+'][pictures_attributes]['+index+'][name]');
        appendDiv.find(".trip-morning-photo").attr("id", 'trip_trip_activities_attributes_'+index+'_pictures_attributes_'+index+'_name');


        appendDiv.find(".trip-morning-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
        appendDiv.find(".trip-morning-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');
      
        appendDiv.find(".trip-morning-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
        appendDiv.find(".trip-morning-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');

        
        appendDiv.insertAfter(beforeAdd);
      }
      function addAfternoonRow(current,beforeAdd){

      // var id = $(current).find('.trip-morning-place').attr('id');
      // var name = $(current).find('.trip-morning-place').attr('name');
      var appendDiv = $(current).clone();

      var index =Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".trip-afternoon-place").attr("name",'trip[trip_activities_attributes]['+index+'][place]');
      appendDiv.find(".trip-afternoon-place").attr("id", 'trip_trip_activities_attributes_'+index+'_place');

      appendDiv.find(".trip-afternoon-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
      appendDiv.find(".trip-afternoon-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');

      appendDiv.find(".trip-afternoon-photo").attr("name",'trip[trip_activities_attributes]['+index+'][pictures_attributes]['+index+'][name]');
      appendDiv.find(".trip-afternoon-photo").attr("id", 'trip_trip_activities_attributes_'+index+'_pictures_attributes_'+index+'_name');


      appendDiv.find(".trip-afternoon-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
      appendDiv.find(".trip-afternoon-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');

      appendDiv.find(".trip-afternoon-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
        appendDiv.find(".trip-afternoon-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');

      appendDiv.insertAfter(beforeAdd);
    }
      function addEveningRow(current,beforeAdd){

      // var id = $(current).find('.trip-morning-place').attr('id');
      // var name = $(current).find('.trip-morning-place').attr('name');
      var appendDiv = $(current).clone();

      var index = Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".trip-evening-place").attr("name",'trip[trip_activities_attributes]['+index+'][place]');
      appendDiv.find(".trip-evening-place").attr("id", 'trip_trip_activities_attributes_'+index+'_place');

      appendDiv.find(".trip-evening-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
      appendDiv.find(".trip-evening-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');

      appendDiv.find(".trip-evening-photo").attr("name",'trip[trip_activities_attributes]['+index+'][pictures_attributes]['+index+'][name]');
      appendDiv.find(".trip-evening-photo").attr("id", 'trip_trip_activities_attributes_'+index+'_pictures_attributes_'+index+'_name');


      appendDiv.find(".trip-evening-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
      appendDiv.find(".trip-evening-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');

      appendDiv.find(".trip-evening-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
      appendDiv.find(".trip-evening-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');
      appendDiv.insertAfter(beforeAdd);
    }




    function removeRow(current,beforeAdd){
        $(current).remove().before(beforeAdd); 
    }


    $("#map-geo").geocomplete({
        map: ".map_canvas",
        mapOptions: {
            zoom: 150
        },
        markerOptions: {
            draggable: true
        }
    })

    $(function() {
      $('#default').stepy({
          backLabel: 'Previous',
          block: true,
          nextLabel: 'Next',
          titleClick: true,
          titleTarget: '.stepy-tab'
      });
    });
    
    $(".single-trip-add-com").geocomplete();

    $(".dpd").datepicker();
    $(".act-date").datepicker();
});


