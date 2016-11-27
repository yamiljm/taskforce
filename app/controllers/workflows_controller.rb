class WorkflowsController < ApplicationController
  before_action :set_workflow, only: [:show, :edit, :update, :destroy, :create_task]

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

    # puts "---------------------"
    # puts workflow_params.to_json

    # workflow_attributes = workflow_params
    # step_definitions_attributes = workflow_attributes.delete("step_definitions")

    # @workflow = Workflow.new(workflow_attributes)

    # @workflow.step_definitions = StepDefinition.createStepDefinitions(step_definitions_attributes)

    @workflow = Workflow.new(workflow_params)
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

    # workflow_attributes = workflow_params
    # step_definitions_attributes = workflow_attributes.delete("step_definitions")

    # StepDefinition.updateStepDefinitions(step_definitions_attributes)

    respond_to do |format|
      if @workflow.update(workflow_params)
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

  def create_task

    if (@workflow)
      @task = Task.createFromWorkflow(@workflow)

      if params[:user_id]
        user = User.find(params[:user_id])
        @task.user = user
      end
      
    puts "----- LA CREO"

    puts "------Va a responder"  
      respond_to do |format|
      puts "---Entro a responder"
      if @task.save
        puts "--------------------PASOooooo por save"
        format.html { redirect_to proc { edit_task_url(@task) }, notice: 'Task was successfully created.' }
        format.json { render :action => :show, status: :created, location: @task }
      else
        puts "-----------------NOOO SALVO"
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
      
    else
      flash[:notice] = "Empty workflow_id"
      redirect_to workflows_url
    end
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Wrong workflow_id"
      redirect_to workflows_url



  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow
      @workflow = Workflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_params
      params[:workflow].permit(:workflow, :id, :name, :type, :description, :_destroy,
                    step_definitions: [ :id, :order, :workflow_id, 
                            field_definitions: 
                            [:id, :name, :field_type, :validationRegex, :required, :errorMessage, :order]
                      ],
                      step_definitions_attributes: [ :id, :order, :workflow_id, :_destroy, 
                            field_definitions_attributes: 
                            [:id, :name, :field_type, :validationRegex, :required, :errorMessage, :order, :_destroy, :step_definition_id]
                      ])
    end
end
