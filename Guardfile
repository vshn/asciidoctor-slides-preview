group :presentation do
    # Rebuild documentation when modifying files
    guard :shell do
        watch(/(.*).adoc/) do
            `generate-vshn-slides --filename=slides.adoc`
        end
    end

    # Refresh browser when folder with HTML files changes
    guard :livereload do
        watch(/(.*).html/)
    end
end
