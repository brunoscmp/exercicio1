require 'rails_helper'

RSpec.describe ActionPlanWeek, type: :model do
  describe "presence start_date" do
    user = User.create(name: "bruno")
    supervisor_action_plan = user.supervisor_action_plan.create( active_agents: 2, goal: 20, branch: "teste", mont: Date.today)
    action_plan_week = supervisor_action_plan.action_plan_weeks.create( start_date: Date.today, end_date: Date.today + 1.day, week_number: 1 )
    context "is action_plan_week valid" do
      it {expect(action_plan_week.valid?).to eq(true) }       
    end
    context "when start_date is present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)
      end   
    end
    context "when start_date is not present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:start_date)
        expect(plan_week.errors.messages).to have_value(["Campos Obrigatórios"])  
      end
    end
    context "when end_date is present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)
      end   
    end
    context "when end_date is not present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:end_date)
        expect(plan_week.errors.messages).to have_value(["Campos Obrigatórios"])  
      end
    end
    context "when week_number is present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)
      end   
    end
    context "when week_number is not present" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:week_number)
        expect(plan_week.errors.messages).to have_value(["Campos Obrigatórios"])  
      end
    end
    
  end
end
