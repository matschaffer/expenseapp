// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(function () {
  $('#new-purchase-link').click(function (e) {
    e.preventDefault();
    $("<div class='panel'>").
      load(this.href).
      insertAfter(this);
  });

  function postHandler(result) {
    var $result = $(result);
    var $errors = $result.find('#error_explanation');

    if ($errors.length) {
      $('#error_explanation').remove();
      $errors.insertBefore("#new_purchase");
    } else {
      $result.insertBefore("#new-purchase-link");
      $("#new-purchase-link").next('.panel').remove();
    }
  }
  $('#new_purchase').live('submit', function (e) {
    e.preventDefault();
    var postBody = $(this).serialize();
    $.post(this.action, postBody, postHandler);
  });
});
