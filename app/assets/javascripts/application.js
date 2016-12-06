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
});

$(document).ajaxStart(function() {
   $("#spinner").fadeIn('slow');
}).ajaxStop(function() {
    $("#spinner").hide();
});



$(window).load(function() {
	$("#spinner").fadeOut("slow");
})