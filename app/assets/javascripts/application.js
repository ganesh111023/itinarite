// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require jquery-ui
//= require autocomplete-rails
//= require jquery.remotipart
//= require private_pub
//= require conversation
//= require chat
//


$(function() {
    $("li.dropdown").hover(
        function(){ $(this).addClass('open') },
        function(){ $(this).find('a.user-setting-dropdown').attr("aria-expanded", "true") }
    );
});



$(document).ready(function(){
	$("#spinner").hide();
	user_id = $('meta[name=user-id]').attr("content");
	debugger	
	current_path = window.location.pathname;
	if(current_path == "/"){
		$(".new_feed").addClass("active_link");
	}
	else if(current_path == "/trips"){
		$(".my_trip").addClass("active_link");
	}
	else if(current_path == "/trips/new"){
		$(".new_trip_m").addClass("active_link");
	}
	else if(current_path == "/conversations"){
		$(".conv").addClass("active_link");
	}
	else if(current_path == "/future_trip"){
		$(".future_trip").addClass("active_link");
	}
	else if(current_path == "/user_dashboard/"+ user_id +"/followers"){
		$(".my_followers").addClass("active_link");
	}
	else if(current_path == "/user_dashboard/"+ user_id +"/following"){
		$(".i_m_following").addClass("active_link");
	}	
});

$(document).ajaxStart(function() {
   $("#spinner").fadeIn('slow');
}).ajaxStop(function() {
    $("#spinner").hide();
});

$(window).load(function() {
	$("#spinner").fadeOut("slow");
});
