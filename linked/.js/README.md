# .js

[dotjs](https://github.com/defunkt/dotjs) has awesome interface, but I don't like running a server just for it and seeing its response in Network tab of developer tools.
And dotjs setup bothers me.
Thus I use another way to load user scripts using Tampermonkey.

- Install Tampermonkey [★](https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo?hl=ja)
- Enable accessibility for local file URL in chrome://extensions
- Manually install script below

```js
// ==UserScript==
// @name       load_all
// @namespace  http://k0kubun.com
// @version    1.0
// @description  load all
// @match      *://*/*
// @copyright  2014+, I
/* load jQuery */
// @require http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js
/* load local file */
// @require file:///Users/k0kubun/.js/all.js
// ==/UserScript==
```

## Build all.js

```sh
# You can manually build all.js by ./build
$ ./build

# Watch *.js and automatically execute ./build
$ bundle install
$ ./autobuild
```
