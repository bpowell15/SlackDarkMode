#/bin/sh

FILE=/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
CSS_SOURCE=https://raw.githubusercontent.com/bpowell15/SlackDarkMode/master/black.css

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
