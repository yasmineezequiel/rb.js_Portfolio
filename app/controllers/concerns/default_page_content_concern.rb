module DefaultPageContentConcern
    extend ActiveSupport::Concern

    included do
        before_action :set_title
    end

    def set_title 
        @page_title = "Y Portfolio | Scuba Coding"
    end
end