group :presentation do
    # Rebuild documentation when modifying files
    guard :shell do
        watch(/slides.adoc/) do
            `generate-vshn-slides --filename=slides.adoc`
        end
    end

    # Refresh browser when folder with HTML files changes
    guard :livereload do
        watch(/slides.html/)
    end
end
