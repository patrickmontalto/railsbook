# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.post').find('.comment-text').click (event) ->
    $(this).parents().eq(3).find('.comment-input').focus
    event.preventDefault()
    return
  return