#!/bin/sh

service sogod stop

rm -rf /usr/lib64/GNUstep/SOGo/WebServerResources/img/sogo.ico
rm -rf /usr/lib64/GNUstep/SOGo/WebServerResources/img/sogo-full.svg
rm -rf /usr/lib64/GNUstep/SOGo/WebServerResources/css/theme-default.css
rm -rf /usr/lib64/GNUstep/SOGo/Templates/MainUI/SOGoRootPage.wox
rm -rf /usr/lib64/GNUstep/SOGo/WebServerResources/js/Common.js

cp -r sogo-full.svg  sogo.ico  /usr/lib64/GNUstep/SOGo/WebServerResources/img/
cp -r theme-default.css  /usr/lib64/GNUstep/SOGo/WebServerResources/css/
cp -r SOGoRootPage.wox /usr/lib64/GNUstep/SOGo/Templates/MainUI/
cp -r Common.js /usr/lib64/GNUstep/SOGo/WebServerResources/js/

service sogod start
