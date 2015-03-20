$(document).ready ->
  $('.expand').on 'click', 'h3', ->
    $('#panel').slideDown(1500)
    $('#banner').fadeOut(2000)
    return false
  $('.collapse').on 'click', 'h3', ->
    $('#panel').slideUp(1500)
    $('#banner').fadeIn(2000)
    return false
