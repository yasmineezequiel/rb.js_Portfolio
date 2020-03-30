module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        super || guest_user 
        # super is a method built in from devise for user and rails will check first if super is equal true and if not will test the right OpenStruct rails built in method.
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end
end
