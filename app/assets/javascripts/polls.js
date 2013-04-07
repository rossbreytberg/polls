// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var poll_option_count = 2;

function on_color_select(hex) {}

function show_colorpicker(event) {
  on_color_select = function(hex) {
    var color_input = $(event.target);
    color_input.css('background', hex);
  };
  var colorpicker = $('#colorpicker');
  var x_offset = colorpicker.outerWidth() / 2;
  var y_offset = colorpicker.outerHeight() / 2;
  $('#colorpicker').css({'left': event.pageX - x_offset, 'top': event.pageY - y_offset }).show();
  $(document).click(hide_colorpicker);
  return false;
}

function hide_colorpicker() {
  $(document).unbind('click', hide_colorpicker);
  $('#colorpicker').hide();
}

function add_poll_option() {
  var poll_options = $('.poll_option');
  var new_poll_option = poll_options.first().clone().addClass('removable_poll_option');
  function update_attribute_number(element, attribute) {
    var new_attribute_value = $(element).attr(attribute).replace('0', poll_option_count);
    $(element).attr(attribute, new_attribute_value);
  }
  var labels = new_poll_option.find('label');
  labels.each(function() {
    update_attribute_number(this, 'for');
  });
  var inputs = new_poll_option.find('input');
  inputs.each(function() {
    update_attribute_number(this, 'id');
    update_attribute_number(this, 'name');
  });
  inputs.val('');
  poll_options.last().after(new_poll_option);
  $(document).scrollTop(new_poll_option.offset().top);
  poll_option_count++;
  return false;
}

function remove_poll_option() {
  var removable_poll_options = $('.removable_poll_option');
  if (removable_poll_options.length > 0) {
    removable_poll_options.last().remove();
    poll_option_count--;
  }
  return false;
}

function on_filter_change() {
  var filter = $(this).val();
  var query = filter ? '?filter=' + filter : '';
  window.location.search = query;
}

$(document).ready(function() {
  ColorPicker(document.getElementById('colorpicker'), function(hex) {
    on_color_select(hex);
  });
  $('#colorpicker').click(function(e) {e.stopPropagation();});
  $('.color_input').click(show_colorpicker);
  $('.link_to_add_poll_option').click(add_poll_option);
  $('.link_to_remove_poll_option').click(remove_poll_option);
  $('#filter').bind('change', on_filter_change);
});