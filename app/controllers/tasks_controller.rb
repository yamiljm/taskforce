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
      @tasks = Task.all #Task.includes([steps: :fields]).all
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

    @task.steps = createSteps(steps_attributes)

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

  def createSteps(steps_attributes) 
    steps = []
    steps_attributes.each { |step_attribute| 
      fields_attributes = step_attribute.delete("fields")
      step = Step.new(step_attribute)
      step.fields = fields_attributes.map{ |field_attribute| 
        Field.new(field_attribute)
      }
      steps.push(step)
    }
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.permit(:task,:id, :name, :task_type, :description, :status, :currentStep,
                    steps: [ :id, :order, :task_id, 
                            fields: 
                            [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :value]
                      ])
    end
end
