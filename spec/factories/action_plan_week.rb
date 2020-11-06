FactoryBot.define do
    factory :action_plan_week do
        start_date { Date.current }
        end_date { Date.current + 1.day }  
        week_number { 1 }    
        supervisor_action_plan_id { 1 }
    end
end