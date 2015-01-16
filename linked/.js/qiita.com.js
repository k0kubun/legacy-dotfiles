if (location.pathname != '/') {
  return
}

var loadedCount = 0
var ignoreExpression = /( \| |#ruby)/

function filterTracks() {
  $('.item-box.track').each(function() {
    var text = $(this).find('h1 a').text();
    if (text.match(ignoreExpression)) {
      $(this).hide();
    }
  });
}

function tryFilter() {
  if ($('.item-box.track').length > loadedCount) {
    filterTracks();
    loadedCount = $('.item-box.track').length
  } else {
    setTimeout(tryFilter, 100);
  }
}

setTimeout(tryFilter, 100);
$(document).delegate('.more-button', 'click', function(event) {
  setTimeout(tryFilter, 100);
});
