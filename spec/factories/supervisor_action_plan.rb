FactoryBot.define do
    factory :supervisor_action_plan do
        active_agents { 2 }   
        goal { 20 }   
        mont { Date.today }
        branch { "teste" }
        action_plan_weeks { [ create( :action_plan_week) ] }         
    end
end