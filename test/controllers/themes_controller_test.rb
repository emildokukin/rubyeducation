require "test_helper"

class ThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @theme = themes(:one)
  end

  test "should get index" do
    get themes_url, as: :json
    assert_response :success
  end

  test "should create theme" do
    assert_difference("Theme.count") do
      post themes_url, params: { theme: { name: @theme.name, qty_items: @theme.qty_items } }, as: :json
    end

    assert_response :created
  end

  test "should show theme" do
    get theme_url(@theme), as: :json
    assert_response :success
  end

  test "should update theme" do
    patch theme_url(@theme), params: { theme: { name: @theme.name, qty_items: @theme.qty_items } }, as: :json
    assert_response :success
  end

  test "should destroy theme" do
    assert_difference("Theme.count", -1) do
      delete theme_url(@theme), as: :json
    end

    assert_response :no_content
  end
end
