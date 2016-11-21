class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  # GET /tasks
  # GET /tasks.json
  def index

    if params[:user_id] 
      user = User.find(params[:user_id])
      if user != nil
        @tasks = user.tasks
      else
        @tasks = []
      end
    else 
      @tasks = Task.all
    end
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Wrong post it"
      redirect_to tasks_url
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @buton_tag = "FOFOFO"
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create

    task_attributes = task_params
    steps_attributes = task_attributes.delete("steps")

    @task = Task.new(task_attributes)

    @task.steps = Step.createSteps(steps_attributes)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    task_attributes = task_params
    steps_attributes = task_attributes.delete("steps")

    Step.updateSteps(steps_attributes)

    respond_to do |format|
      if @task.update(task_attributes)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_workflow

    if (params[:workflow_id])
      workflow = Workflow.find(params[:workflow_id])
      @task = Task.createFromWorkflow(workflow)

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
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.permit(:task,:id, :name, :task_type, :description, :status, :currentStep, :user_id,
                    steps: [ :id, :order, :task_id, 
                            fields: 
                            [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :value]
                      ])
    end
end
