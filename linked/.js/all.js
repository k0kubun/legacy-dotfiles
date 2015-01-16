$(window).load(function() {
  if (location.href.match(/^https?:\/\/github.com/)) {
    console.log('github');
  } else if (location.href.match(/^https?:\/\/qiita.com/)) {
    console.log('qiita');
  }
});
