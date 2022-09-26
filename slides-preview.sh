#!/bin/sh

# Generate HTML
generate-vshn-slides --filename slides.adoc

# Copy files
cp /Caddyfile /build/Caddyfile
cp /Guardfile /build/Guardfile

# Launch Caddy web server
echo ""
echo " ________________________________________________________________________________________"
echo "|                                                                                        |"
echo "| Open http://localhost:2020 in your browser to see the slides                           |"
echo "|                                                                                        |"
echo "| IMPORTANT! LIVE RELOADING REQUIRES A BROWSER PLUGIN!                                   |"
echo "| More info here: https://git.vshn.net/education/slides-preview#user-content-livereload  |"
echo "|________________________________________________________________________________________|"
echo ""
caddy start
guard -p --no-interactions --group=slides
