class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include DeviseWhitelistConcern
    include SetSourceConcern
    include CurrentUserConcern

    before_action :set_title

    def set_title 
        @page_title = "Y Portfolio | Scuba Coding"
    end
end
