# ==============================================================================
# VIDEO
# =====

$(document).ready ->
  coachVideo = videojs 'coach-video', { 
    muted: true, 
    preload: "auto" 
  }


# ==============================================================================
# PUSHDOWN
# ========

  pushIt = () ->
    extra = $('#extra')
    if extra.css('top') == '0px' 
      extra.css('top', '+=520') 
    else 
      extra.css('top', '0')

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

  $('video').on 'click', ->
    coachVideo.pause()


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

  stopTimeout = () ->
    window.clearTimeout(timer)

  window.onload = ->
    window.setTimeout (->
      openPanel()
      startTimeout() if isMouseOver == false
    ), 1000
    document.getElementById('panel').onmouseover = ->
      isMouseOver = true
      console.log("is mouse over?", isMouseOver)
      stopTimeout()
    document.getElementById('panel').onmouseout = ->
      isMouseOver = false
      console.log("is mouse over?", isMouseOver)
      startTimeout()


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