class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  # GET /steps
  # GET /steps.json
  def index

    if params[:task_id] 
      task = Task.find(params[:task_id])
      if task != nil
        @steps = task.steps
      else
        @steps = []
      end
    else 
      @steps = Step.all
    end
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create

    step_attributes = step_params
    fields_attributes = step_attributes.delete("fields")

    @step = Step.new(step_attributes)
    @step.fields = Field.createFields(fields_attributes)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step, notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update

    step_attributes = step_params
    fields_attributes = step_attributes.delete("fields")

    Field.updateFields(fields_attributes)

    respond_to do |format|
      if @step.update(step_attributes)
        format.html { redirect_to @step, notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.permit(:id, :order, :task_id, 
        fields: [:id, :name, :fieldType, :validationRegex, :required, :errorMessage, :order, :value]
        )
    end

end
