require 'test_helper'

class VenerationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veneration = venerations(:one)
  end

  test "should get index" do
    get venerations_url
    assert_response :success
  end

  test "should get new" do
    get new_veneration_url
    assert_response :success
  end

  test "should create veneration" do
    assert_difference('Veneration.count') do
      post venerations_url, params: { veneration: { caption: @veneration.caption, score: @veneration.score, user_id: @veneration.user_id } }
    end

    assert_redirected_to veneration_url(Veneration.last)
  end

  test "should show veneration" do
    get veneration_url(@veneration)
    assert_response :success
  end

  test "should get edit" do
    get edit_veneration_url(@veneration)
    assert_response :success
  end

  test "should update veneration" do
    patch veneration_url(@veneration), params: { veneration: { caption: @veneration.caption, score: @veneration.score, user_id: @veneration.user_id } }
    assert_redirected_to veneration_url(@veneration)
  end

  test "should destroy veneration" do
    assert_difference('Veneration.count', -1) do
      delete veneration_url(@veneration)
    end

    assert_redirected_to venerations_url
  end
end
