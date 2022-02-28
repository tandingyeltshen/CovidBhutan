class AdminController < ApplicationController
    def admin 
        if is_admin
            # @admin = User.where(:id => 2,:email => "admin@gmail.com").count()
            @active = Patient.where(to_date:nil).count
            @recovered = Patient.where.not(to_date:nil).count
            @total_case = Patient.all.count
        end

        # @isolation = User.all()
        @isolation = User.where.not(invitation_accepted_at: nil)
        # @user = User.joins('LEFT JOIN patients ON patients.created_by = users.id')
    end
    def inviteduser
        if is_admin
            @isolation = User.where(invitation_accepted_at: nil)
        end
    end

    def patientdetails
        @patient = Patient.all
        authorize @patient
    end
    def blockuser
        if is_admin
            @user = User.find_by(id:params[:blockid])
            if @user.update(is_blocked:1)
                redirect_to "/admin", notice: "User blocked" 
            else
                format.html { redirect_to "/admin", notice: "Try again" }
            end 
        end
    end
    def unblockuser
        if is_admin
            @user = User.find_by(id:params[:blockid])
            if @user.update(is_blocked:0)
                redirect_to "/admin", notice: "User unblocked" 
            else
                redirect_to "/admin", notice: "Try again"
            end 
        end
    end

    def deluser
        @user = User.find_by(:id=>params[:delid])
        @user.destroy
        redirect_to "/admin", notice: "User Removed" 
    end

end 