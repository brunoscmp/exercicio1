class ActionPlanWeeksController < ApplicationController
    def create
        @supervisorAction = SupervisorActionPlan.find(params.try( :[], :supervisor_action_plan_id ))
        params.try( :[], :action_plan_week )[:week_number] = week_number_of_month( 
            params.try( :[], :action_plan_week )[ :start_date ] )
        @actionPlanWeek = @supervisorAction.action_plan_weeks.create( action_plan_Params)
        @actionPlanWeek.valid?
        redirect_to supervisor_action_plan_path( @supervisorAction.id )
    end
    def destroy
        @supervisorAction = SupervisorActionPlan.find(params.try( :[], :supervisor_action_plan_id ))
        @actionPlan = @supervisorAction.action_plan_weeks.find(params.try( :[], :id ))
        @actionPlan.destroy
        redirect_to supervisor_action_plan_path(@supervisorAction)
    end
    def week_number_of_month date
        dateConvert = Date.parse date rescue nil
        dateConvert.cweek - dateConvert.at_beginning_of_month.cweek
    end
    private
        def action_plan_Params
            params.require( :action_plan_week ).permit( :start_date, :end_date, :business_activity, :week_number )
        end
end
