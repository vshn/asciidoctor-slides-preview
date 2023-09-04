# Very important!
ignore %r{^node_modules/}

group :presentation do
    # Rebuild documentation when modifying files
    guard :shell do
        watch(/(.*).adoc/) do |a|
            time = Time.new
            timestring = time.strftime("%H:%M:%S")
            puts "#{timestring} - INFO - Got change for: #{a[0]}"
            `generate-vshn-slides --filename=slides.adoc`
        end
    end

    # Refresh browser when folder with HTML files changes
    guard :livereload do
        watch(/slides.html/)
    end
end
