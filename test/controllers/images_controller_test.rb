require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get images_url, as: :json
    assert_response :success
  end

  test "should create image" do
    assert_difference("Image.count") do
      post images_url, params: { image: { ave_value: @image.ave_value, file: @image.file, float: @image.float, name: @image.name, theme_id: @image.theme_id } }, as: :json
    end

    assert_response :created
  end

  test "should show image" do
    get image_url(@image), as: :json
    assert_response :success
  end

  test "should update image" do
    patch image_url(@image), params: { image: { ave_value: @image.ave_value, file: @image.file, float: @image.float, name: @image.name, theme_id: @image.theme_id } }, as: :json
    assert_response :success
  end

  test "should destroy image" do
    assert_difference("Image.count", -1) do
      delete image_url(@image), as: :json
    end

    assert_response :no_content
  end
end
