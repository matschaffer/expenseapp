// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require_tree .


$(function () {
  $("#new-purchase-link").one('click', function (e) {
    e.preventDefault();
    var $panel = $("<div class='panel'>");
    $panel.load(this.href).insertAfter(this);
    $(this).click(function (e) {
      e.preventDefault();
      $panel.toggle();
    });
  });

  function postHandler (res) {
    var $res = $(res),
        $err = $res.find('#error_explanation');
    if ($err.length) {
      $("#error_explanation").remove();
      $err.insertBefore("#new_purchase");
    } else {
      $res.appendTo("table.purchases");
      $("#new-purchase-link").
        next('.panel').
        remove();
    }
  }

  $("#new_purchase").live('submit', function (e) {
    e.preventDefault();
    var body = $(this).serialize();
    $.post(this.action, body, postHandler);
  });
});
