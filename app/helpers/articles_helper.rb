module ArticlesHelper

    def truncate_str(str, length)
        print length
        str.slice(0..length) + "..."
    end

    def date_full_words(date)
        date.strftime("%A, %d %b %Y")
    end

end
