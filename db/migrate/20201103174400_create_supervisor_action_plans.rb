class CreateSupervisorActionPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :supervisor_action_plans do |t|
      t.string :branch, null: false
      t.date :mont, null: false
      t.integer :active_agents,default: 0
      t.decimal :goal, precision: 10, scale: 2, default: 0, length: {minimum: 0}
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :supervisor_action_plans,[ :branch,:mont,:user_id], unique: true
  end
end
