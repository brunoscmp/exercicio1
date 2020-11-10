Rails.application.routes.draw do
  
  resources :supervisor_action_plans do
    resources :action_plan_weeks
  end
    
end
