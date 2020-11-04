class SupervisorActionPlan < ApplicationRecord
  
 #attr_accessor :goal, :active_agents, :branch
  
  #def initialize(goal, active_agents, branch)
   # @goal, @active_agents, @branch =  goal, active_agents, branch
  #end

  belongs_to :user
  has_many  :action_plan_weeks, dependent: :destroy
  validates :active_agents,:goal, numericality: {greater_than_or_equal_to: 0,message: "Meta não pode ser menor que zero"}
  validates :active_agents,numericality: {only_integer: true, greater_than_or_equal_to: 0, message: "Campo Agentes Ativos obrigatório"}
  validates :branch, :month, :user_id,presence: {message: "Campos Obrigatórios"}
  validates_uniqueness_of :branch, scope: %i[:month :user_id],message: "Registros Duplicados"
end
