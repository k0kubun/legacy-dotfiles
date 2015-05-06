// Force to disable personalized search
if ($('form[action="/search"]').length > 0) {
  $('form[action="/search"]').append('<input type="hidden" name="pws" value="0">')
}
