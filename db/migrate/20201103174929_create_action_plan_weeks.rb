class CreateActionPlanWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :action_plan_weeks do |t|
      t.integer :week_number
      t.date :start_date
      t.date :end_date
      t.string :business_activity
      t.references :supervisor_action_plan, foreign_key: true

      t.timestamps
    end
  end
end
