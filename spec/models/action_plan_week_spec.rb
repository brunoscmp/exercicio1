require 'rails_helper'

RSpec.describe ActionPlanWeek, type: :model do
  it "data de inicio menor que fim" do
    u = User.create(name: "bruno")
    u.save
    s = u.supervisor_action_plan.create(active_agents: 2,goal: 30,mont: Date.today,branch: "teste")
    s.save
    #sup = SupervisorActionPlan.last
    #action_plan = sup.action_plan_weeks.new
    #action_plan.start_date = "2020-11-04"
    #action_plan.end_date = "2020-11-05"
    #action_plan.week_number = 1
    ##expect(action_plan.start_date.strftime('%F')).to eq("2020-11-04") 
    #sup.action_plan_weeks.present?
    expect(SupervisorActionPlan.count).to eq(1) 
  end 
  context "teste classe" do
    it { should be_an(ActionPlanWeek) }
  end 
  describe "presence start_date" do
    let(:user) { create(:user) }
    context "when start_date is present" do
      it do
          byebug

          expect(SupervisorActionPlan.count).to eq(1) 
        end
    end
    context "when start_date is not present" do
      
    end
    
  end
end
