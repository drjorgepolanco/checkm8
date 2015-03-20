$(document).ready ->
  $('.expand').on 'click', ->
    $('#panel').slideDown(1000)
    $('#banner').fadeOut(2000)
    return false
  $('#wrapper').on 'click', ->
    $('#panel').slideUp(2000)
    $('#banner').fadeIn(2000)
