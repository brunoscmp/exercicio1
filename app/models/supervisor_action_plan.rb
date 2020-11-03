class SupervisorActionPlan < ApplicationRecord
  belongs_to :user
  has-many :action_plan_week
end
