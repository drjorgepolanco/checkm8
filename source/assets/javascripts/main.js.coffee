# ==============================================================================
# VIDEO
# =====

$(document).ready ->
  coachVideo = document.getElementById('coach-video')
  coachVideo.muted = "muted"

  $('.expand').on 'click', 'h3', ->
    coachVideo.load()
    coachVideo.play()
    coachVideo.muted = false
    return

  $('video').on 'click', ->
    if coachVideo.paused then coachVideo.play() else coachVideo.pause()
    return


# ==============================================================================
# PUSHDOWN
# ========

  pushIt = () ->
    extra = $('#extra')
    if extra.css('top') == '0px' 
      extra.css('top', '+=520') 
    else 
      extra.css('top', '0')
    return

  openPanel = () ->
    $('#panel').slideDown(1500)
    $('#banner').fadeOut(1200)
    pushIt('#extra')
    coachVideo.play()
    return

  closePanel = () ->
    $('#panel').slideUp(1500)
    $('#banner').fadeIn(2000)
    pushIt('#extra')
    coachVideo.pause()
    return

  panelAction = (selector, action) ->
    $(selector).on 'click', 'h3', ->
      action()
    return

  panelAction('.expand', openPanel)
  panelAction('.collapse', closePanel)

  $('.panel').on 'click', (e) ->
    if e.target == @
      window.open("http://www.coach.com/", "_blank")


# ==============================================================================
# USER INTERACTION
# ================
  
  timer = undefined
  isMouseOver = false

  startTimeout = () ->
    timer = window.setTimeout (->
      console.log("closing")
      closePanel()
    ), 8000
    return

  stopTimeout = () ->
    window.clearTimeout(timer)
    return

  window.onload = ->
    window.setTimeout (->
      openPanel()
      startTimeout() if isMouseOver == false
    ), 1000
    document.getElementById('panel').onmouseover = ->
      isMouseOver = true
      stopTimeout()
    document.getElementById('panel').onmouseout = ->
      isMouseOver = false
      startTimeout()
    return


# ==============================================================================
# CAROUSEL
# ========

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