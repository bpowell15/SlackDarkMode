#/bin/sh

FILE=/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
CSS_SOURCE=~/Users/bricepowell/Desktop/black.css

cp /Users/bricepowell/Desktop/black.css /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static

cat >>$FILE <<EOL

document.addEventListener('DOMContentLoaded', function() {
    let tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
    $.ajax({
        url: "$CSS_SOURCE",
        success: function(css) {
            \$('<style></style>').appendTo('head').html(css + tt__customCss);
        }
   });
});

EOL
