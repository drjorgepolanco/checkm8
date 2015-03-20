# ==============================================================================
# PUSHDOWN
# ========

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


# ==============================================================================
# CAROUSEL
# ========

$(document).ready ->
  $('#carousel').slick
    infinite: true
    speed: 600
    autoplay: true
    centerMode: true
    centerPadding: 20
    cssEase: 'ease'
    pauseOnHover: true
    slidesToShow: 1
    slidesToScroll: 1
    autoplaySpeed: 2000
  return