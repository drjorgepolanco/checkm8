# ==============================================================================
# VIDEO
# =====

$(document).ready ->
  coachVideo = videojs('coach-video', { muted: true, preload: "auto" })


# ==============================================================================
# PUSHDOWN
# ========

  pushIt = (selector) ->
    e = $(selector)
    if e.css('top') == '0px' 
      e.css('top', '+=520') 
    else 
      e.css('top', '0')

  openPanel = (down, out) ->
    $(down).slideDown(1500)
    $(out).fadeOut(1200)
    pushIt('#extra')
    coachVideo.play()
    interact('#panel')

  closePanel = (up, inward) ->
    $(up).slideUp(1500)
    $(inward).fadeIn(2000)
    pushIt('#extra')
    coachVideo.pause()
    return

  timer = undefined

  interact = (selector) ->
    # $(selector).each ->
    $(@).on 'mouseleave', ->
      console.log("User gone")
      timer = setTimeout (->
        console.log("time to close!")
        closePanel('#panel', '#banner')  
      ), 8000
    $('*').on 'click', ->
      console.log("User interacting")
      clearTimeout timer
    $('.panel, #coach-video, .slider, .item, #twitter').on "mouseover", ->
      console.log("stopping timeout")
      clearTimeout timer

  $('.expand').on 'click', 'h3', ->
    openPanel('#panel', '#banner')
    interact('#panel')

  $('.collapse').on 'click', 'h3', ->
    closePanel('#panel', '#banner')

  $('.panel').on 'click', (e) ->
    if e.target == @
      window.open("http://www.coach.com/", "_blank")
  
  window.onload = ->
    setTimeout (->
      openPanel('#panel', '#banner')
      setTimeout (->
        closePanel('#panel', '#banner')
      ), 9000
    ), 1000


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