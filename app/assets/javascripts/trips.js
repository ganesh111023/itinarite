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
      appendDiv.find(".trip-morning-place").val("");
      
      appendDiv.find(".trip-morning-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
      appendDiv.find(".trip-morning-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');
      appendDiv.find(".trip-morning-desc").val("");

      appendDiv.find(".trip-morning-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
      appendDiv.find(".trip-morning-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');
    
      appendDiv.find(".trip-morning-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
      appendDiv.find(".trip-morning-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');
      appendDiv.find(".trip-morning-date").val("");

      appendDiv.find(".trip-morning-place").on("click keypress", function(e){
        set_google_model_attr(e);
      });
      appendDiv.find(".act-date")
        .removeClass('hasDatepicker')
        .removeData('datepicker')
        .unbind()
        .datepicker({
            dateFormat: "DD M d yy",
            changeMonth: true,
            yearRange: "-100:+0",
            changeYear: true,
            minDate: new Date($("#trip_start_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
            maxDate: new Date($("#trip_end_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
            showButtonPanel: false,
            beforeShow: function() {
                setTimeout(function() {
                    $('.ui-datepicker').css('z-index', 99999999999999);
                }, 0);
            }
        });
      
      appendDiv.insertAfter(beforeAdd);
    }
    function addAfternoonRow(current,beforeAdd){

      // var id = $(current).find('.trip-morning-place').attr('id');
      // var name = $(current).find('.trip-morning-place').attr('name');
      var appendDiv = $(current).clone();

      var index =Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".trip-afternoon-place").attr("name",'trip[trip_activities_attributes]['+index+'][place]');
      appendDiv.find(".trip-afternoon-place").attr("id", 'trip_trip_activities_attributes_'+index+'_place');
      appendDiv.find(".trip-afternoon-place").val("");

      appendDiv.find(".trip-afternoon-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
      appendDiv.find(".trip-afternoon-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');
      appendDiv.find(".trip-afternoon-desc").val("");

      appendDiv.find(".trip-afternoon-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
      appendDiv.find(".trip-afternoon-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');

      appendDiv.find(".trip-afternoon-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
      appendDiv.find(".trip-afternoon-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');
      appendDiv.find(".trip-afternoon-date").val("");

      appendDiv.find(".trip-afternoon-place").on("click keypress", function(e){
        set_google_model_attr(e);
      });
      appendDiv.find(".act-date")
          .removeClass('hasDatepicker')
          .removeData('datepicker')
          .unbind()
          .datepicker({
              dateFormat: "DD M d yy",
              changeMonth: true,
              yearRange: "-100:+0",
              changeYear: true,
              minDate: new Date($("#trip_start_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
              maxDate: new Date($("#trip_end_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
              showButtonPanel: false,
              beforeShow: function() {
                  setTimeout(function() {
                      $('.ui-datepicker').css('z-index', 99999999999999);
                      
                  }, 0);
              }
          });

      appendDiv.insertAfter(beforeAdd);
    }
    function addEveningRow(current,beforeAdd){

      // var id = $(current).find('.trip-morning-place').attr('id');
      // var name = $(current).find('.trip-morning-place').attr('name');
      var appendDiv = $(current).clone();

      var index = Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".trip-evening-place").attr("name",'trip[trip_activities_attributes]['+index+'][place]');
      appendDiv.find(".trip-evening-place").attr("id", 'trip_trip_activities_attributes_'+index+'_place');
      appendDiv.find(".trip-evening-place").val("");

      appendDiv.find(".trip-evening-desc").attr("name",'trip[trip_activities_attributes]['+index+'][description]');
      appendDiv.find(".trip-evening-desc").attr("id", 'trip_trip_activities_attributes_'+index+'_description');
      appendDiv.find(".trip-evening-desc").val("");

      appendDiv.find(".trip-evening-type").attr("name",'trip[trip_activities_attributes]['+index+'][activity_type]');
      appendDiv.find(".trip-evening-type").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_type');

      appendDiv.find(".trip-evening-date").attr("name",'trip[trip_activities_attributes]['+index+'][activity_date]');
      appendDiv.find(".trip-evening-date").attr("id", 'trip_trip_activities_attributes_'+index+'_activity_date');
      appendDiv.find(".trip-evening-date").val("");

      appendDiv.find(".trip-evening-place").on("click keypress", function(e){
        set_google_model_attr(e);
      });
      appendDiv.find(".act-date")
          .removeClass('hasDatepicker')
          .removeData('datepicker')
          .unbind()
          .datepicker({
              dateFormat: "DD M d yy",
              changeMonth: true,
              yearRange: "-100:+0",
              changeYear: true,
              minDate: new Date($("#trip_start_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
              maxDate: new Date($("#trip_end_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") ),
              showButtonPanel: false,
              beforeShow: function() {
                  setTimeout(function() {
                      $('.ui-datepicker').css('z-index', 99999999999999);
                  }, 0);
              }
          });
      appendDiv.insertAfter(beforeAdd);
    }
    function removeRow(current,beforeAdd){
        $(current).remove().before(beforeAdd); 
    }

    $("#map-geo").on("click keypress", function(e){
      set_google_model_attr(e);
    });

    $("#morning-trip-place").on("click keypress", function(e){
      set_google_model_attr(e);
    });

    $("#afternoon-trip-place").on("click keypress", function(e){
      set_google_model_attr(e);
    });

    $("#evening-trip-place").on("click keypress", function(e){
      set_google_model_attr(e);
    });

    function set_google_model_attr(e){
      invoker = e.currentTarget.id
      $("#us6-dialog").attr("collling-obj", invoker);
      $("#us6-dialog").modal('show');
    }

    $(".google-map-selected-location").on("click", function(){
     invoker_id =  $(this).parent().parent().parent().parent().attr("collling-obj")
     location_val = $(this).parent().siblings().closest(".modal-body").find("#us3-address").val();
     $("#"+invoker_id).val(location_val);
     $("#us6-dialog").modal('hide');
    });

    $(function() {
      $('#default').stepy({
          backLabel: 'Previous',
          block: true,
          nextLabel: 'Next',
          titleClick: true,
          titleTarget: '.stepy-tab'
      });
    });
    
    $(".single-trip-add-com").locationpicker();

    $(".dpd1").datepicker({
        dateFormat: "DD M d yy",
        changeMonth: true,
        yearRange: "-100:+0",
        changeYear: true,
        maxDate: new Date(),
        showButtonPanel: false,
        beforeShow: function() {
            setTimeout(function() {
                $('.ui-datepicker').css('z-index', 99999999999999);
            }, 0);
        }
    });

    $(".dpd2").datepicker({
        dateFormat: "DD M d yy",
        changeMonth: true,
        yearRange: "-100:+0",
        changeYear: true,
        maxDate: new Date(),
        showButtonPanel: false,
        beforeShow: function() {
            setTimeout(function() {
                $('.ui-datepicker').css('z-index', 99999999999999);
            }, 0);
        }
    });
    $(".act-date").datepicker({
        dateFormat: "DD M d yy",
        changeMonth: true,
        yearRange: "-100:+0",
        changeYear: true,
        maxDate: new Date(),
        showButtonPanel: false,
        beforeShow: function() {
            setTimeout(function() {
                $('.ui-datepicker').css('z-index', 99999999999999);
            }, 0);
        }
    });
    $(".tab-pane:first").addClass("active");
    $(".trip-tab").on("click", function(){
      var tab_id = $(this).attr('href').replace('#', '');
      $(".tab-pane").removeClass("active");
      $(".activity_tab-"+tab_id).addClass("active");
    });
    edit_entire_row();


    //upload activities photo
    $("#addmorning-act-image").on("click",function(){
      addMorningActImage(".morning-act-image-upload:last" );
      $('#removemorning-act-image').fadeIn();
    });

    function addMorningActImage(contant){
      var appendDiv = $(contant).clone();
      var index = Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".image").attr("name",'trip_activity[pictures_attributes]['+index+'][name]');
      appendDiv.find(".image").attr("id", 'trip_activity_pictures_attributes_'+index+'_name');        
      appendDiv.insertAfter(contant);
    }

    $("#removemorning-act-image").click(function(){
      var size = $('.morning-act-image-upload').length;
      if(size > 1){
        removeRow(".morning-act-image-upload:last");
      }
       //hide remove button when div count = 1
       if (size == 1) {
          $('#removemorning-act-image').fadeOut();
      }
    });

    $("#addafternoon-act-image").on("click",function(){
      addAfterActImage(".after-act-image-upload:last" );
      $('#removeafter-act-image').fadeIn();
    });

    function addAfterActImage(contant){
      var appendDiv = $(contant).clone();
      var index = Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".image").attr("name",'trip_activity[pictures_attributes]['+index+'][name]');
      appendDiv.find(".image").attr("id", 'trip_activity_pictures_attributes_'+index+'_name');        
      appendDiv.insertAfter(contant);
    }
    $("#removeafter-act-image").click(function(){
      
      var size = $('.after-act-image-upload').length;
      if (size > 1){
        removeRow(".after-act-image-upload:last");
      }
       //hide remove button when div count = 1
       if (size == 1) {
          $('#removefter-act-iamge').fadeOut();
      }
    });

    $("#addevening-act-image").on("click",function(){
      addAfterActImage(".evening-act-image-upload:last" );
      $('#removeafternoon-act-image').fadeIn();
    });

    function addEveningActImage(contant){
      var appendDiv = $(contant).clone();
      var index = Math.floor(100000 + Math.random() * 900000);
      appendDiv.find(".image").attr("name",'trip_activity[pictures_attributes]['+index+'][name]');
      appendDiv.find(".image").attr("id", 'trip_activity_pictures_attributes_'+index+'_name');        
      appendDiv.insertAfter(contant);
    }
    $("#removeevening-act-iamge").click(function(){
      var size = $('.evening-act-image-upload').length;
        if(size > 1){
          removeRow(".evening-act-image-upload:last");
        }
       //hide remove button when div count = 1
       if (size == 1) {
          $('#removeevening-act-iamge').fadeOut();
      }
    });
});

$(document).on("change","#trip_start_date",function(ev) {
  tripStartDate =  new Date($("#trip_start_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  tripEndDate =  new Date($("#trip_end_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  
  if (tripStartDate > tripEndDate){
        alert('The start date can not be greater then the end date');
        $("#trip_start_date").val("");
    }
  change_date_dicker_range(tripStartDate, tripEndDate);
});

$(document).on("change","#trip_end_date",function() {
  tripStartDate =  new Date($("#trip_start_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  tripEndDate =  new Date($("#trip_end_date").val().replace( /(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3") );
  if (tripEndDate < tripStartDate ){
        alert('The end date can not be less then the start date');
        $("#trip_end_date").val("");
    }
  change_date_dicker_range(tripStartDate, tripEndDate);
});

function change_date_dicker_range(tpStart, tpEnd){
  $(".act-date").datepicker('destroy');
  $(".act-date").datepicker({
    minDate: tpStart,
    maxDate: tpEnd,
    dateFormat: "DD M d yy",
    changeMonth: true,
    yearRange: "-100:+0",
    changeYear: true,
    showButtonPanel: false,
    beforeShow: function() {
        setTimeout(function() {
            $('.ui-datepicker').css('z-index', 99999999999999);
        }, 0);
    }
  });

}

function edit_entire_row() {
  $("tr td:not(.disable_link)").click(function () {
    if (this.closest('tr').attributes["link"] != undefined) {
        window.location = this.closest('tr').attributes["link"].value
    }
  });
}

function initialize_map(markers){
    var mapOptions = {
      center: new google.maps.LatLng(markers[0].lat, markers[0].long),
      zoom: 0,
      minZoom: 0,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("gmap_geocoding"), mapOptions);
    var infoWindow = new google.maps.InfoWindow();
    var lat_lng = new Array();
    var latlngbounds = new google.maps.LatLngBounds();
    for (i = 0; i < markers.length; i++) {
      var data = markers[i]
      var myLatlng = new google.maps.LatLng(data.lat, data.long);
      lat_lng.push(myLatlng);
      var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: data.address
      });


      latlngbounds.extend(marker.position);
        (function (marker, data) {
        google.maps.event.addListener(marker, "click", function (e) {
          infoWindow.setContent(data.address);
          infoWindow.open(map, marker);
        });
        })(marker, data);
    }
    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
  }


function initialize_full_map () {

  var mapOptions = {
    center: new google.maps.LatLng(0, 0),
    zoom: 0,
    minZoom: 1
  };

  var map = new google.maps.Map(document.getElementById('gmap_geocoding'),mapOptions );

  var allowedBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(85, -180), // top left corner of map
    new google.maps.LatLng(-85, 180)  // bottom right corner
  );

  var k = 5.0; 
  var n = allowedBounds .getNorthEast().lat() - k;
  var e = allowedBounds .getNorthEast().lng() - k;
  var s = allowedBounds .getSouthWest().lat() + k;
  var w = allowedBounds .getSouthWest().lng() + k;
  var neNew = new google.maps.LatLng( n, e );
  var swNew = new google.maps.LatLng( s, w );
  boundsNew = new google.maps.LatLngBounds( swNew, neNew );
  map .fitBounds(boundsNew);

}

function init_single_location_on_google(act_id, markers){
  var mapOptions = {
      center: new google.maps.LatLng(markers[0].lat, markers[0].long),
      zoom: 0,
      minZoom: 0,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    var map = new google.maps.Map(document.getElementById("activity_gmap-"+ act_id), mapOptions);
    var infoWindow = new google.maps.InfoWindow();
    var lat_lng = new Array();
    var latlngbounds = new google.maps.LatLngBounds();
    for (i = 0; i < markers.length; i++) {
      var data = markers[i]
      var myLatlng = new google.maps.LatLng(data.lat, data.long);
      lat_lng.push(myLatlng);
      var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: data.address
      });

      latlngbounds.extend(marker.position);
        (function (marker, data) {
        google.maps.event.addListener(marker, "click", function (e) {
          infoWindow.setContent(data.address);
          infoWindow.open(map, marker);
        });
        })(marker, data);
    }
    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
}