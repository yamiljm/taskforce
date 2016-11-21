class StepDefinitionsController < ApplicationController
  before_action :set_step_definition, only: [:show, :edit, :update, :destroy]

  # GET /step_definitions
  # GET /step_definitions.json
  def index
    if params[:workflow_id] 
      workflow = Workflow.find(params[:workflow_id])
      if workflow != nil
        @step_definitions = workflow.step_definitions
      else
        @step_definitions = []
      end
    else 
      @step_definitions = StepDefinition.all
    end
  end

  # GET /step_definitions/1
  # GET /step_definitions/1.json
  def show
  end

  # GET /step_definitions/new
  def new
    @step_definition = StepDefinition.new
  end

  # GET /step_definitions/1/edit
  def edit
  end

  # POST /step_definitions
  # POST /step_definitions.json
  def create

    step_definition_attributes = step_definition_params
    field_definitions_attributes = step_definition_attributes.delete("field_definitions")

    @step_definition = StepDefinition.new(step_definition_attributes)
    @step_definition.field_definitions = FieldDefinition.createFieldDefinitions(field_definitions_attributes)

    respond_to do |format|
      if @step_definition.save
        format.html { redirect_to @step_definition, notice: 'Step definition was successfully created.' }
        format.json { render :show, status: :created, location: @step_definition }
      else
        format.html { render :new }
        format.json { render json: @step_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_definitions/1
  # PATCH/PUT /step_definitions/1.json
  def update

    step_definition_attributes = step_definition_params
    field_definitions_attributes = step_definition_attributes.delete("field_definitions")

    FieldDefinition.updateFieldDefinitions(field_definitions_attributes)

    respond_to do |format|
      if @step_definition.update(step_definition_attributes)
        format.html { redirect_to @step_definition, notice: 'Step definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @step_definition }
      else
        format.html { render :edit }
        format.json { render json: @step_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /step_definitions/1
  # DELETE /step_definitions/1.json
  def destroy
    @step_definition.destroy
    respond_to do |format|
      format.html { redirect_to step_definitions_url, notice: 'Step definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_definition
      @step_definition = StepDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_definition_params
      params.permit(:id, :order, :workflow_id, 
        field_definitions: [:id, :name, :field_type, :validationRegex, :required, :errorMessage, :order]
        )
    end
end
