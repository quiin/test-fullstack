ready = ->
	$('input[data-role=money]').autoNumeric('init', 
  	aSep: ',',
  	aDec: '.',
  	aSign: '$'
	);

$ ->
  ready()
$(document).on('turbolinks:load', ready)
