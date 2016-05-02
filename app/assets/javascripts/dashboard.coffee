# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.post').find('.comment-text').click (event) ->
    $(this).parents().eq(3).find('.comment-input').focus
    event.preventDefault()
    return

  $(':file').filestyle input: false, badge: false
  $('.group-span-filestyle > label').text 'Add Photo'
  $('.group-span-filestyle > label').css 'border-style': 'none', 'padding': '0'
  $('.group-span-filestyle > label').addClass 'status-select'
  $('label.btn.btn-default.status-select').removeClass 'btn-default'

  $('input:file').change ->
    path = $(this).val()
    fileName = path.replace(/^.*\\/, "");
    $(".file_name").text(fileName)
    return
  return