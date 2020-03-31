class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include DeviseWhitelistConcern
    include SetSourceConcern
    include CurrentUserConcern
    include DefaultPageContentConcern

    before_action :set_copyright

    def set_copyright
        @copyright = ScubacodeViewTool::Renderer.copyright 'Scuba Code', 'All rights reserved'
    end
end

module ScubacodeViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end
