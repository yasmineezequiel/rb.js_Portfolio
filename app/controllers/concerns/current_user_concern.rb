module CurrentUserConcern
    extend ActiveSupport::Concern

    included do
        before_action :current_user
    end

    def current_user
        super || guest_user 
        # super is a method built in from devise for user and rails will check first if super is equal true and if not will test the right OpenStruct rails built in method.
    end

    def guest_user
        OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
                # super is a method built in from devise for user and rails will check first if super is equal true and if not will test the right OpenStruct rails built in method.
    end
end
