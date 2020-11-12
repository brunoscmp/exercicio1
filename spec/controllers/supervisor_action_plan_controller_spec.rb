require 'rails_helper'
Rails.application.routes.default_url_options = { host: 'localhost:3000' }

RSpec.describe SupervisorActionPlan, type: :request do
    describe "list of all Supervisor Action Plan" do
       context "a context" do
            it do
                user = User.last
                supervisor = user&.supervisor_action_plan.create( branch: 'list of all Supervisor Action Plan', 
                    mont: '2020-11-30', active_agents: '10', goal: 100)
                get supervisor_action_plans_path
                expect(response).to be_successful
                expect(response.body).to include("list of all Supervisor Action Plan")
            end 
       end
    end
    describe "Get Supervisor Action Plan at ID and test Method Destroy" do
        context "have the Supervisor Action Plan" do
             it do
                user = User.last
                supervisor = user&.supervisor_action_plan.create( branch: 'Get Supervisor Action Plan at ID', 
                     mont: '2020-11-29', active_agents: '5', goal: 100)
                get supervisor_action_plan_path(supervisor.id) 
                expect(response).to be_successful
                expect(response.body).to include("Get Supervisor Action Plan at ID")
            end 
        end
        context "not have the Supervisor Action Plan and test Method Destroy" do
            it do
                user = User.last
                supervisor = user&.supervisor_action_plan.create( branch: 'not have the Supervisor Action Plan', 
                     mont: '2020-11-28', active_agents: '4', goal: 99)
                get supervisor_action_plan_path(supervisor.id)
                expect(response).to be_successful
                expect(response.body).to include("not have the Supervisor Action Plan")
                id = supervisor.id
                supervisor.destroy
                get supervisor_action_plan_path(id)
                expect(response).to be_successful
                expect(response.body).not_to include("not have the Supervisor Action Plan")
           end 
       end
    end
    describe "Method New Supervisor Action Plan" do
        context "Metod New Supervisor Action Plan" do
            it do
                get new_supervisor_action_plan_path
                expect(response).to be_successful
                expect(response.body).to include("Novo Plano de Ação por Supervisor")
            end 
        end
        
    end
    describe "Method Create Supervisor Action Plan" do
        context "Metod Create Supervisor Action Plan" do
            it do
                user = User.last
                params = {}
                params_aux = {}
                params_aux[:branch] = 'Metod Create Supervisor Action Plan' 
                params_aux[:mont] = '2020-11-26'
                params_aux[:active_agents] = 3
                params_aux[:goal] = 98
                params_aux[:user_id] = user.id
                params[:supervisor_action_plan] = params_aux
                post supervisor_action_plans_path, params: params 
                expect(response).to redirect_to supervisor_action_plan_path(SupervisorActionPlan.last.id)
            end 
        end        
    end
    describe "Method Update Supervisor Action Plan" do
        context "Method Update Supervisor Action Plan" do
            it do
                user = User.last
                supervisor = user&.supervisor_action_plan.create( branch: 'Created for test the Method Update Supervisor Action Plan', 
                     mont: '2020-11-25', active_agents: '1', goal: 95)
                expect(supervisor.id).to eq(SupervisorActionPlan.last.id)
                params = {}
                params_aux = {}
                params_aux[:branch] = 'Created for test the Method Update Supervisor Action Plan - UPDATE' 
                params_aux[:mont] = '2020-11-26'
                params_aux[:active_agents] = 7
                params_aux[:goal] = 90
                params_aux[:user_id] = supervisor.user.id
                #params_aux[:id] = supervisor.id
                params[:supervisor_action_plan] = params_aux
                put supervisor_action_plan_path(supervisor.id), params: params 
                expect(response).to redirect_to supervisor_action_plan_path(SupervisorActionPlan.last.id)
                expect(SupervisorActionPlan.last.branch).to eq('Created for test the Method Update Supervisor Action Plan - UPDATE')
            end 
        end        
    end
    describe "Test week number of month" do
        context "correct week number" do
            it do
                action_controller = ActionPlanWeeksController.new
                expect(action_controller.week_number_of_month "2020-11-11").to eq( 2 )                
            end 
        end        
    end
end
  