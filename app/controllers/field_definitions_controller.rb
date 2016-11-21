class FieldDefinitionsController < ApplicationController
  before_action :set_field_definition, only: [:show, :edit, :update, :destroy]

  # GET /field_definitions
  # GET /field_definitions.json
  def index
    if params[:step_definition_id] 
      step_definition = StepDefinition.find(params[:step_definition_id])
      if step_definition != nil
        @field_definitions = step_definition.field_definitions
      else
        @field_definitions = []
      end
    else 
      @field_definitions = FieldDefinition.all
    end
  end

  # GET /field_definitions/1
  # GET /field_definitions/1.json
  def show
  end

  # GET /field_definitions/new
  def new
    @field_definition = FieldDefinition.new
  end

  # GET /field_definitions/1/edit
  def edit
  end

  # POST /field_definitions
  # POST /field_definitions.json
  def create
    @field_definition = FieldDefinition.new(field_definition_params)

    respond_to do |format|
      if @field_definition.save
        format.html { redirect_to @field_definition, notice: 'Field definition was successfully created.' }
        format.json { render :show, status: :created, location: @field_definition }
      else
        format.html { render :new }
        format.json { render json: @field_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_definitions/1
  # PATCH/PUT /field_definitions/1.json
  def update
    respond_to do |format|
      if @field_definition.update(field_definition_params)
        format.html { redirect_to @field_definition, notice: 'Field definition was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_definition }
      else
        format.html { render :edit }
        format.json { render json: @field_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_definitions/1
  # DELETE /field_definitions/1.json
  def destroy
    @field_definition.destroy
    respond_to do |format|
      format.html { redirect_to field_definitions_url, notice: 'Field definition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_definition
      @field_definition = FieldDefinition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_definition_params
      params.permit(:field_definition,:name, :field_type, :validationRegex, :required, :step_definition_id, :errorMessage, :order)
    end
end
