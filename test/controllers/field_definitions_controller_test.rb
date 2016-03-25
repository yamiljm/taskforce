require 'test_helper'

class FieldDefinitionsControllerTest < ActionController::TestCase
  setup do
    @field_definition = field_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_definition" do
    assert_difference('FieldDefinition.count') do
      post :create, field_definition: { errorMessage: @field_definition.errorMessage, name: @field_definition.name, order: @field_definition.order, required: @field_definition.required, step_definition_id: @field_definition.step_definition_id, type: @field_definition.type, validationRegex: @field_definition.validationRegex }
    end

    assert_redirected_to field_definition_path(assigns(:field_definition))
  end

  test "should show field_definition" do
    get :show, id: @field_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_definition
    assert_response :success
  end

  test "should update field_definition" do
    patch :update, id: @field_definition, field_definition: { errorMessage: @field_definition.errorMessage, name: @field_definition.name, order: @field_definition.order, required: @field_definition.required, step_definition_id: @field_definition.step_definition_id, type: @field_definition.type, validationRegex: @field_definition.validationRegex }
    assert_redirected_to field_definition_path(assigns(:field_definition))
  end

  test "should destroy field_definition" do
    assert_difference('FieldDefinition.count', -1) do
      delete :destroy, id: @field_definition
    end

    assert_redirected_to field_definitions_path
  end
end
