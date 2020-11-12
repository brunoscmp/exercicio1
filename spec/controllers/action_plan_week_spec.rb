require 'rails_helper'

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
end
  