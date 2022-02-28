class DashboardController < ApplicationController
    def dashboard
        
    end

    def announcement
        if is_user
            @announcements = Announcement.all
        end
    end
end