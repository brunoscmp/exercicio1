class SupervisorActionPlansController < ApplicationController
    def show
        @supervisorActionPlan = SupervisorActionPlan.find(params[:id])
    end
    def new
       @supervisorActionPlan = SupervisorActionPlan.new 
    end
    def create
        puts "@@@@@@@@ #{params.try(:[],:supervisorActionPlan)[:user_id]}"
        @user = User.find(params.try(:[],:supervisorActionPlan)[:user_id])
        @supervisorActionPlan = @user.supervisor_action_plan.create(supervisorParams)
        if @supervisorActionPlan.save
            redirect_to @supervisorActionPlan
        else
            render 'new'
        end

    end
    private
        def supervisorParams
            params.require( :supervisorActionPlan ).permit( :branch, :mont, :active_agents, :goal,:user_id )
        end
end
