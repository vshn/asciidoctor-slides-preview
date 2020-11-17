#!/bin/sh

# Generate HTML
generate-vshn-slides --filename slides.adoc

# Copy files
cp /Caddyfile /build/Caddyfile
cp /Guardfile /build/Guardfile

# Launch Caddy web server
echo ""
echo " _____________________________________________________________________"
echo "|                                                                     |"
echo "| Open http://localhost:2020 in your browser to see the slides        |"
echo "|                                                                     |"
echo "| IMPORTANT! LIVE RELOADING REQUIRES A BROWSER PLUGIN!                |"
echo "| More info here: https://github.com/vshn/slides-preview#livereload   |"
echo "|_____________________________________________________________________|"
echo ""
caddy start
guard --no-interactions --group=slides
