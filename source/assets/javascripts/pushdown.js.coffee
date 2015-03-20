$(document).ready ->

  pushIt = (selector) ->
    e = $(selector)
    if e.css('top') == '0px' 
      e.css('top', '+=520') 
    else 
      e.css('top', '0')

  $('.expand').on 'click', 'h3', ->
    $('#panel').slideDown(1500)
    $('#banner').fadeOut(1200)
    pushIt('#extra')
    return false

  $('.collapse').on 'click', 'h3', ->
    $('#panel').slideUp(1500)
    $('#banner').fadeIn(2000)
    pushIt('#extra')
    return false
