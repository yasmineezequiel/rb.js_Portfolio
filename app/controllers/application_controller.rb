class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include DeviseWhitelist
    include SetSource

    def current_user
        super || OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
        # super is a method built in from devise for user and rails will check first if super is equal true and if it will return this function if not will test the right OpenStruct rails built in method.
    end
end
