require "test_helper"

class ValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @value = values(:one)
  end

  test "should get index" do
    get values_url, as: :json
    assert_response :success
  end

  test "should create value" do
    assert_difference("Value.count") do
      post values_url, params: { value: { image_id: @value.image_id, integer: @value.integer, user_id: @value.user_id, value: @value.value } }, as: :json
    end

    assert_response :created
  end

  test "should show value" do
    get value_url(@value), as: :json
    assert_response :success
  end

  test "should update value" do
    patch value_url(@value), params: { value: { image_id: @value.image_id, integer: @value.integer, user_id: @value.user_id, value: @value.value } }, as: :json
    assert_response :success
  end

  test "should destroy value" do
    assert_difference("Value.count", -1) do
      delete value_url(@value), as: :json
    end

    assert_response :no_content
  end
end
