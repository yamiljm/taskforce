class WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy]

  # GET /workflows
  # GET /workflows.json
  def index
    @workflows = Workflow.all
  end

  # GET /workflows/1
  # GET /workflows/1.json
  def show
  end

  # GET /workflows/new
  def new
    @workflow = Workflow.new
  end

  # GET /workflows/1/edit
  def edit
  end

  # POST /workflows
  # POST /workflows.json
  def create

    workflow_attributes = workflow_params
    step_definitions_attributes = workflow_attributes.delete("step_definitions")

    @workflow = Workflow.new(workflow_attributes)

    puts "--------------"
    puts step_definitions_attributes.to_json


    @workflow.stepDefinitions = StepDefinition.createStepDefinitions(step_definitions_attributes)

    respond_to do |format|
      if @workflow.save
        format.html { redirect_to @workflow, notice: 'Workflow was successfully created.' }
        format.json { render :show, status: :created, location: @workflow }
      else
        format.html { render :new }
        format.json { render json: @workflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workflows/1
  # PATCH/PUT /workflows/1.json
  def update

    workflow_attributes = workflow_params
    step_definitions_attributes = workflow_attributes.delete("step_definitions")

    StepDefinition.updateStepDefinitions(step_definitions_attributes)

    respond_to do |format|
      if @workflow.update(workflow_attributes)
        format.html { redirect_to @workflow, notice: 'Workflow was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow }
      else
        format.html { render :edit }
        format.json { render json: @workflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workflows/1
  # DELETE /workflows/1.json
  def destroy
    @workflow.destroy
    respond_to do |format|
      format.html { redirect_to workflows_url, notice: 'Workflow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_params
      params.permit(:workflow, :id, :name, :type, :description,
                    step_definitions: [ :id, :order, :workflow_id, 
                            fieldDefinitions: 
                            [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order]
                      ])
    end
end
