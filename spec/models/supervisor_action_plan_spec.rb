require 'rails_helper'

RSpec.describe SupervisorActionPlan, type: :model do
  describe "tests of supervisor_action_plan" do
    user = User.create(name: "bruno")
    supervisor_action_plan = user.supervisor_action_plan.create( active_agents: 2, goal: 20, branch: "teste", mont: Date.today)
    context "is supervisor_action_plan valid" do
      it {expect(supervisor_action_plan.valid?).to eq(true) }       
    end
    context "when branch is present" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)
      end   
    end
    context "when branch is not present" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages).to have_key(:branch)
        expect(supervisor_plan.errors.messages).to have_value(["Campos Obrigatórios"])  
      end
    end
    context "when mont is present" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)
      end   
    end
    context "when mont is not present" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages).to have_key(:mont)
        expect(supervisor_plan.errors.messages).to have_value(["Campos Obrigatórios"])  
      end
    end
    context "when goal is number positive" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)
      end   
    end
    context "when goal is not number positive" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = -30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages).to have_key(:goal)
        expect(supervisor_plan.errors.messages).to have_value(["Meta não pode ser menor que zero"])  
      end
    end
    context "when active_agents is number positive" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.active_agents = 15
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)
      end   
    end
    context "when active_agents is not number positive" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 3
        supervisor_plan.goal = 30
        supervisor_plan.branch = "test"
        supervisor_plan.mont = Date.today
        supervisor_plan.active_agents = -15
        supervisor_plan.valid?
        array_msg = supervisor_plan.errors.messages.values[0]
        expect(supervisor_plan.errors.messages).to have_key(:active_agents)
        expect(array_msg[0]).to eq("Meta não pode ser menor que zero")  
      end
    end
    # let(:supervisor_plan_aux) do 
    #     user.supervisor_action_plan.create(active_agents: 2, goal: 20, branch: "teste", mont: Date.today)
    #   end
    context "duplicate for fields branch, mont" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 2
        supervisor_plan.goal = 20
        supervisor_plan.branch = "teste"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages).to have_key(:branch)
        expect(supervisor_plan.errors.messages).to have_value(["Registros Duplicados"])   
      end
    end
    context "not duplicated with different branch field" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 2
        supervisor_plan.goal = 20
        supervisor_plan.branch = "teste2"
        supervisor_plan.mont = Date.today
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)    
      end
    end
    context "not duplicated with different mont field" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        supervisor_plan.active_agents = 2
        supervisor_plan.goal = 20
        supervisor_plan.branch = "teste2"
        supervisor_plan.mont = Date.today + 1.day
        supervisor_plan.valid?
        expect(supervisor_plan.errors.messages.empty?).to eq(true)    
      end
    end
    context "belongs to user" do
      it do
        supervisor_plan = user.supervisor_action_plan.new
        expect(supervisor_plan.present?).to eq(true)    
      end
    end
  end
end
