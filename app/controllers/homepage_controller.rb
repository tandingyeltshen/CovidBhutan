class HomepageController < ApplicationController 
    skip_before_action :authenticate_user!
    def homepage
    end
end