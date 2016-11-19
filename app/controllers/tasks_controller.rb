class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  # GET /tasks
  # GET /tasks.json
  def index

    if params[:user_id] 
      user = User.find(params[:user_id])
      puts user.to_yaml
      if user != nil
        @tasks = user.tasks
        puts @tasks.to_yaml
      else
        puts "task VACIOOOOOOO"
        @tasks = []
      end
    else 
      @tasks = Task.all #Task.includes([steps: :fields]).all
    end
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Wrong post it"
      redirect_to tasks_url
      # redirect_to :action => 'index'
   #  respond_to do |format|
   #    format.json do
   #      tareas = []
   #      @tasks.each do |t|
   #        tarea = {}
   #        tarea[:currentStep] = t.currentStep
   #        tarea[:description] = t.description
   #        tarea[:status] = t.status
   #        tarea[:type] = t.task_type 
   #        fields = []
   #        t.steps.each do |step|
   #          logger.info("step: " + step.to_json)
   #          step.fields.each do |field|
   #            fields.push(field)
   #          end
   #        end
   #        tarea[:steps] = {}
   #        tarea[:steps][:field]= fields
   #        tareas.push(tarea)
   #      end
   #      render json: tareas.to_json
   #    end
   #    format.html do
   #      logger.info("respondio a html")
   #      #render index
   #    end
   # # end
    
   #  end
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
    @user = User.find(1)
    @task = @user.build_tasks(task_params)
    
    #@task = Task.build(task_params)  
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
      params.require(:task).permit(:name, :task_type, :description, :status, :currentStep)
    end
end
