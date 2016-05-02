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
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap-filestyle

$(document).delegate('form[data-remote]', 'ajax:error', function(e, xhr, status, statusText) {
  $("#error-div").hide();
	$("#error-div").html('  <div id=\"error_explanation\">\n    <div class=\"alert alert-danger\">\n      The form contains 1 error.\n    <\/div>\n    <ul>\n      <li>Picture: Wrong file type uploaded<\/li>\n      <\/ul>\n  <\/div>\n');
	$("#error-div").fadeIn("slow");
	$(".file_name").text("");
});