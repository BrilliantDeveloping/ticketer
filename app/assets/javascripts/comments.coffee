
$(document).ready ->
  $('#comment_content').keypress (event) ->
    if event.which == 13 and event.shiftKey
      alert 'shift enter pressed'
    if event.which == 13
      $('form').submit()
    