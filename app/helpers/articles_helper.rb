module ArticlesHelper

    def truncate_str(str, length)
        print length
        str.slice(0..length) + "..."
    end

    def date_str(date)
        date.strftime("%A, %d %b %Y %l:%M %p %Z")
    end

end
