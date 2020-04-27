module PortfoliosHelper

    def self.image_generator(height:, width:)
        "http://via.placeholder.com/#{height}x#{width}"
    end  

    def portfolio_img img, type
        if img.model.main_image? || img.model.thumb_image?
          img
        elsif type == 'thumb'
          image_generator(height: '350', width: '200')
        elsif type == 'main'
          image_generator(height: '600', width: '400')
        end
    end

    class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
        CodeRay.scan(code, language ||= :plaintext).div
      end
    end
  
    def markdown(text)
      coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
  
      options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true,
      }
  
      markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
      markdown_to_html.render(text).html_safe
  end
end