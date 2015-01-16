if (location.href.match(/^https?:\/\/(www.|)google.co.jp/)) {
  // Force to disable personalized search
  if ($('form[action="/search"]').length > 0) {
    $('form[action="/search"]').append('<input type="hidden" name="pws" value="0">')
  }
} else if (location.href.match(/^https?:\/\/(www.|)nicovideo.jp/)) {
  // Replace unified ranking with movie ranking
  if ($('a[href="uni_ranking"]').length > 0) {
    $('a[href="uni_ranking"] span').text('ランキング');
    $('a[href="uni_ranking"]').attr('href', 'ranking');
  }
} else if (location.href.match(/^https?:\/\/(www.|)qiita.com/)) {
  if (location.pathname != '/') {
    return;
  }

  var loadedCount = 0;
  var ignoreExpression = /( \| |#ruby)/;

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
      loadedCount = $('.item-box.track').length;
    } else {
      setTimeout(tryFilter, 100);
    }
  }

  setTimeout(tryFilter, 100);
  $(document).delegate('.more-button', 'click', function(event) {
    setTimeout(tryFilter, 100);
  });
}