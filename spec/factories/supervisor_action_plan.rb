FactoryBot.define do
    factory :supervisor_action_plan do
        action_plan_weeks { [ create( :action_plan_week) ] }         
        active_agents { 2 }   
        goal { 20 }   
        mont { Date.today }
        branch { "teste" }
        user_id { 1 }
    end
end