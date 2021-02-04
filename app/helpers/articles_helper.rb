module ArticlesHelper

    def truncate_str(str, length)
        print length
        str.slice(0..length) + "..."
    end

    def date_full_words(date)
        date.strftime("%A, %d %b %Y")
    end

    def preview_banner(article, illustration)
        return image_tag article.image.url, alt: "Thoughts", class: "mb-4 preview" if (article and article.image.present?)
        image_tag "thoughts#{illustration}.svg", alt: "Thoughts", class: "mb-4 preview"
    end

end
