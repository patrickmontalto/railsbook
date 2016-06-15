# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $('.post').find('.comment-text').click (event) ->
    event.preventDefault()
    $(this).closest(".post").find('.comment-input').focus()
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