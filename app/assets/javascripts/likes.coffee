# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', 'a.like-post', (status,data,xhr)->
  # the `data` parameter is the decoded JSON object
  # update counter
  $(".like-count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.like-post[data-id=#{data.id}]").each ->
  	$a = $(this)
  	if $a.attr('href') == "/posts/#{data.id}/like"
  		$a.attr('href', "/posts/#{data.id}/dislike")
  		$("#post_#{data.id}").find(".like-commands").addClass("liked")
  	else
  		$a.attr('href', "/posts/#{data.id}/like")
  		$("#post_#{data.id}").find(".like-commands").removeClass("liked")
  	return

  return