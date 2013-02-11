// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var poll_option_count = 2;

function remove_poll_option() {
  var removable_poll_options = $('.removable_poll_option');
  if (removable_poll_options.length > 0) {
    removable_poll_options.last().remove();
    poll_option_count--;
  }
  return false;
}

function add_poll_option() {
  var poll_options = $('.poll_option');
  var new_poll_option = poll_options.first().clone().addClass('removable_poll_option');
  new_poll_option.find('input').val('');
  poll_options.last().after(new_poll_option);
  $(document).scrollTop(new_poll_option.offset().top);
  poll_option_count++;
  return false;
}

$(document).ready(function() {
  $('.link_to_add_poll_option').click(add_poll_option);
  $('.link_to_remove_poll_option').click(remove_poll_option);
});