ready = ->
	$('input[data-role=phone]').mask('?9999999999999 ext 99999', placeholder: ' ')

$ ->
  ready()
$(document).on('turbolinks:load', ready)