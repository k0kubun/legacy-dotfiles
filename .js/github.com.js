// zeroclipboard copy button
function copyButton(copyTarget) {
  return '<span style="position: absolute; top: 8px; right: 70px; display: none;"' +
    ' class="js-zeroclipboard zeroclipboard-link" data-clipboard-text="' +
    copyTarget +
    '" data-copied-hint="copied!" title="Copy SHA"><span class="octicon octicon-clippy"></span></span>'
}

// for pull request page
if (window.location.pathname.match(/[^/]+\/[^/]+\/pull/)) {
  // for copy button positioning
  $(".commits .commit-meta").attr("style", "position: relative;");

  // prepend copybutton
  $(".commits .commit-meta code").each(function() {
    var commitHash = $(this).text()
    $(this).prepend(copyButton(commitHash));
  });

  // hover to show clipboard link
  $(document).delegate(".commits .commit", "mouseenter", function() {
    $(".zeroclipboard-link").hide()
    $(this).find(".zeroclipboard-link").show();
  });
}
