class SupervisorActionPlansController < ApplicationController
    def index
        @supervisor_action_plans = SupervisorActionPlan.all
    end
    def show
        @supervisorActionPlan = SupervisorActionPlan.find_by_id(params[:id])
    end
    def new
       @supervisorActionPlan = SupervisorActionPlan.new 
    end
    def edit
        @supervisorActionPlan = SupervisorActionPlan.find(params.try( :[], :id ))
    end
    def create
        @user = User.find(params.try(:[],:supervisor_action_plan)[:user_id])
        @supervisorActionPlan = @user.supervisor_action_plan.create(supervisorParams)
        if @supervisorActionPlan.save
            redirect_to @supervisorActionPlan
        else
            render 'new'
        end

    end
    def update
        @supervisorActionPlan = SupervisorActionPlan.find(params.try(:[],:id))
        if @supervisorActionPlan.update(supervisorParams)
            redirect_to @supervisorActionPlan
        else
            render 'edit'
        end        
    end
    def destroy
        @supervisorActionPlan = SupervisorActionPlan.find(params.try(:[],:id))
        @supervisorActionPlan.destroy
        redirect_to supervisor_action_plans_path
    end
    private
        def supervisorParams
            params.require( :supervisor_action_plan ).permit( :branch, :mont, :active_agents, :goal,:user_id)
        end
end
