FactoryBot.define do
    factory :user do
      name { "bruno" }
      trait :supervisor_with_action_plan do
        supervisor_action_plans { [ create( :supervisor_action_plan) ] }        
      end  
    end
end