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
}