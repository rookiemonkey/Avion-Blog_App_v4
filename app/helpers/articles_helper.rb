module ArticlesHelper

    def truncate_str(str, length)
        print length
        str.slice(0..length) + "..."
    end

end
