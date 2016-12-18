class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :select_user]


  # GET /tasks
  # GET /tasks.json
  def index

    if params[:user_id] 
      user = User.find(params[:user_id])
      if user != nil
        @tasks = user.tasks.order(created_at: :desc)
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
  end

  # GET /tasks/1/edit
  def edit
  end

  def select_user

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
    #Diferencia si viene de un json o de un form

    puts "TASK PARAMS"
    puts task_params.to_json

    puts "----------------------"

    if (!task_params[:task].blank? ) 
      if task_params[:steps].nil?
        task_attributes = task_params[:task]
      else
        task_attributes = task_params
        task_attributes.delete("task")
      end
    else
      task_attributes = task_params
    end

    previus_user_id = task_attributes.delete("previus_user_id")

    steps_attributes = task_attributes.delete("steps")

    Step.updateSteps(steps_attributes)

    respond_to do |format|
      puts "TASK ATTRIBUTES "
      puts task_attributes.to_json
      if @task.update(task_attributes)

        if PushNotificationHelper.shouldSendNotification(@task, previus_user_id)
          PushNotificationHelper.sendNotification(@task)
        end

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

    def task_params
      params.permit(:id, :name, :task_type, :description, :status, :currentStep, :user_id, :previus_user_id, 
                    task: [:id, :name, :task_type, :description, :status, :currentStep, :user_id, :previus_user_id,
                        steps: [ :id, :order, :task_id, 
                            fields: 
                            [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :value, :step_id, :options]

                      ]],
                    steps: [ :id, :order, :task_id, 
                            fields: 
                            [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :value, :step_id, :options]
                      ])
    end
end
