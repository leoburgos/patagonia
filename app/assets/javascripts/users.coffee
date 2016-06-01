# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.date-picker').datepicker()
  $('#user_return_rate').val('5')
  $('#user_recommendation_rate').val('5')

  $('.box1 .option').click ->
    if !($(this).hasClass('active'))
      $('.box1 .option').removeClass('active')
      $(this).addClass('active')
      $('#user_return_rate').val($(this).text())
    return

  $('.box2 .option').click ->
    if !($(this).hasClass('active'))
      $('.box2 .option').removeClass('active')
      $(this).addClass('active')
      $('#user_recommendation_rate').val($(this).text())
    return

  $(document).on 'click', '.cancel-links', ->
    $('#new_user').fadeIn();
    $('input:not(#user_recommendation_rate):not(#user_return_rate)').val('')
    return

  return