
class Task < ActiveRecord::Base
	include Status

    has_many :steps, dependent: :destroy
    belongs_to :user
    accepts_nested_attributes_for :steps, allow_destroy: true

    def self.createFromWorkflow(workflow)
    	task = Task.new
    	task.name = workflow.name
    	task.task_type = workflow.type
    	task.description = workflow.description
    	task.status = Status::PENDING
    	task.currentStep = 0

    	if workflow.step_definitions
    		task.steps = []
    		workflow.step_definitions.each do |stepDefinition|
    			step = stepDefinition.transformToStep
    			task.steps.push(step)
    		end
    	end

    	return task
    end

end
