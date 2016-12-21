jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true

ready = ->
  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

window.fbAsyncInit = ->
  FB.init(appId: '<%= ENV["YTP_FACEBOOK_ID"]%>', xbml: true, version: 'v2.8', cookie: true)

  ready()

$(document).on('turbolinks:load', ready)