  $(document).ready(function () {
    //Add input box to the trip event
    $("#addmorning").click(function(){
        addRow(".clone:first",".clone:last" );
        $('#removemorning').fadeIn();
    });
    $("#addafternoon").click(function(){
        addRow(".afternoon:first",".afternoon:last" );
        $('#removeafternoon').fadeIn();
    });
    $("#addevening").click(function(){
        addRow(".evening:first",".evening:last" );
        $('#removeevening').fadeIn();
    });

    //Remoe input box from the event
    $("#removemorning").click(function(){
        removeRow(".clone:last",".add_morning");
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
        removeRow(".evening:last",".addevening_div");
        var size = $('.evening').length;

         //hide remove button when div count = 1
         if (size == 1) {
            $('#removeevening').fadeOut();
        }
    });

    function addRow(current,beforeAdd){
        $(current).clone().insertAfter(beforeAdd);
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
    
});