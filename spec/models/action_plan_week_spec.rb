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
        array_msg = plan_week.errors.messages.values[0]
        expect(plan_week.errors.messages).to have_key(:week_number)
        expect(array_msg[0]).to eq("Campos Obrigatórios")  
      end
    end
    context "start_date is smaller or equal than end_date" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)  
      end
    end
    context "start_date is greater than end_date" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today + 1.day
        plan_week.end_date = Date.today
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:start_date)
        expect(plan_week.errors.messages).to have_value(["data inicio não poder maior que data fim"])  
      end
    end
    context "week_number is not number" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today
        plan_week.week_number = "text"
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:week_number)
        expect(plan_week.errors.messages).to have_value(["Campo week_number deve ser numerico"])  
      end
    end
    context "week_number is number" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today
        plan_week.week_number = 3
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)   
      end
    end
    context "duplicate for fields week_number, start_date, end_date" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 1
        plan_week.valid?
        expect(plan_week.errors.messages).to have_key(:week_number)
        expect(plan_week.errors.messages).to have_value(["has already been taken"])   
      end
    end
    context "not duplicated with different start_date field" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today - 1.day
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 1
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)    
      end
    end
    context "not duplicated with different end_date field" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today
        plan_week.week_number = 1
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)    
      end
    end
    context "not duplicated with different week_number field" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        plan_week.start_date = Date.today
        plan_week.end_date = Date.today + 1.day
        plan_week.week_number = 2
        plan_week.valid?
        expect(plan_week.errors.messages.empty?).to eq(true)    
      end
    end
    context "belongs to supervisor_action_plan" do
      it do
        plan_week = supervisor_action_plan.action_plan_weeks.new
        expect(plan_week.present?).to eq(true)    
      end
    end
  end
end
