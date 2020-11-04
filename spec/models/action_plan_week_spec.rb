require 'rails_helper'

RSpec.describe ActionPlanWeek, type: :model do
  it "tem data de inicio" do
    action_plan = ActionPlanWeek.new
    @sup = SupervisorActionPlan.last
    action_plan.start_date = "2020-11-04"
    action_plan.end_date = "2020-11-04"
    action_plan.week_number = 1
    #expect(action_plan.start_date.strftime('%F')).to eq("2020-11-04") 
    expect(action_plan.valid?).to eq(true) 
  end
end
