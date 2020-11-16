// Needed to do this in the JS config since there's a space in the filename
// See: https://github.com/jigish/slate/pull/253
slate.bind("b:cmd;ctrl;alt", function() {
  slate.shell("/usr/bin/open -a '/Applications/Google Chrome.app'", false, '~/')
});

slate.bind("d:cmd;ctrl;alt", function() {
  slate.shell("/usr/bin/open 'Dropbox (JDB)'", false, '~/')
});
