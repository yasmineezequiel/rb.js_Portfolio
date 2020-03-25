module DefaultPageContentConcern
    extend ActiveSupport::Concern

    included do
        before_action :set_pages_defaults
    end

    def set_pages_defaults
        @page_title = "Y Portfolio | Scuba Code"
        @seo_keywords = "Yasmine Ezequiel Portfolio"
    end
end