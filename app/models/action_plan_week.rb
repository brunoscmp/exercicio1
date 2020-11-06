class ActionPlanWeek < ApplicationRecord
  belongs_to :supervisor_action_plan
  validates :start_date, presence: {message: "Campos Obrigatórios"}
  validates :end_date, presence: {message: "Campos Obrigatórios"} 
  validates :week_number, :supervisor_action_plan_id, presence: {message: "Campos Obrigatórios"}
  validates_uniqueness_of :week_number, scope: [:start_date, :end_date, :supervisor_action_plan_id]
  validate :start_date_cannot_be_greater

  def start_date_cannot_be_greater
    if start_date.present? && end_date.present?
      if start_date > end_date
        errors.add(:start_date, "data inicio não poder maior que data")
      end
    end
  end
end
