$(window).load(function() {
  if (location.href.match(/^https?:\/\/github.com/)) {
    console.log('github');
  } else if (location.href.match(/^https?:\/\/www.nicovideo.jp/)) {
    if ($('a[href="uni_ranking"]').length > 0) {
      $('a[href="uni_ranking"] span').text('ランキング');
      $('a[href="uni_ranking"]').attr('href', 'ranking');
    }
  }
});
