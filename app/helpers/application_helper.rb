module ApplicationHelper
    def auth_token
        html = "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{ form_authenticity_token }\"/>"

        html.html_safe
    end

    def ugly_lyrics(lyrics)
        formatted_lyrics = ""
        lyrics.lines.each do |line|
            formatted_lyrics << "&#9835; #{h(line)}"
        end

        "<pre class='lyrics'>#{formatted_lyrics}</pre".html_safe
    end
end
