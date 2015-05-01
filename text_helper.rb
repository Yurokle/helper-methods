module ActionView
  module Helpers
    module TextHelper
      def simple_format_all_p(text, html_options = {}, options = {})
        wrapper_tag = options.fetch(:wrapper_tag, :p)
        text = sanitize(text) if options.fetch(:sanitize, true)

        paragraphs = text.blank? ? [] : text.to_str.gsub(/\r\n?/, "\n").gsub(/\n+/, "\n").split(/\n/)

        if paragraphs.empty?
          content_tag(wrapper_tag, nil, html_options)
        else
          paragraphs.map! { |paragraph|
            content_tag(wrapper_tag, raw(paragraph), html_options)
          }.join("\n\n").html_safe
        end
      end

      # describe '#simple_format_all_p' do
      #   it 'should wrap text betweetn all line breaks in <p>...</p>' do
      #     text = "Hey there\nJust some\r\n\r\nRandom\n\nVery\r\n\nRandom\n\n\nText\n"
      #     html = "<p>Hey there</p>\n\n<p>Just some</p>\n\n<p>Random</p>\n\n<p>Very</p>\n\n<p>Random</p>\n\n<p>Text</p>"
      #     helper.simple_format_all_p(text).should == html
      #   end
      # end
    end
  end
end