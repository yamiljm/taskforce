require 'test_helper'

class StepDefinitionsControllerTest < ActionController::TestCase
  setup do
    @step_definition = step_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_definition" do
    assert_difference('StepDefinition.count') do
      post :create, step_definition: { order: @step_definition.order, task_id: @step_definition.task_id }
    end

    assert_redirected_to step_definition_path(assigns(:step_definition))
  end

  test "should show step_definition" do
    get :show, id: @step_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step_definition
    assert_response :success
  end

  test "should update step_definition" do
    patch :update, id: @step_definition, step_definition: { order: @step_definition.order, task_id: @step_definition.task_id }
    assert_redirected_to step_definition_path(assigns(:step_definition))
  end

  test "should destroy step_definition" do
    assert_difference('StepDefinition.count', -1) do
      delete :destroy, id: @step_definition
    end

    assert_redirected_to step_definitions_path
  end
end
