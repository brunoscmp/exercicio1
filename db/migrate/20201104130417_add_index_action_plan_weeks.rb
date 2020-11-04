class AddIndexActionPlanWeeks < ActiveRecord::Migration[5.2]
  def change
    add_index :action_plan_weeks,[ :week_number,:start_date,:end_date,:supervisor_action_plans_id], unique: true, name: "index_action_plan_weeks_on_number_start_end_supervisor_id"
  end
end
