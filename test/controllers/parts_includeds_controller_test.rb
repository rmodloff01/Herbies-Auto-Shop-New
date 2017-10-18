require 'test_helper'

class PartsIncludedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parts_included = parts_includeds(:one)
  end

  test "should get index" do
    get parts_includeds_url
    assert_response :success
  end

  test "should get new" do
    get new_parts_included_url
    assert_response :success
  end

  test "should create parts_included" do
    assert_difference('PartsIncluded.count') do
      post parts_includeds_url, params: { parts_included: { inv_id: @parts_included.inv_id, part_id: @parts_included.part_id } }
    end

    assert_redirected_to parts_included_url(PartsIncluded.last)
  end

  test "should show parts_included" do
    get parts_included_url(@parts_included)
    assert_response :success
  end

  test "should get edit" do
    get edit_parts_included_url(@parts_included)
    assert_response :success
  end

  test "should update parts_included" do
    patch parts_included_url(@parts_included), params: { parts_included: { inv_id: @parts_included.inv_id, part_id: @parts_included.part_id } }
    assert_redirected_to parts_included_url(@parts_included)
  end

  test "should destroy parts_included" do
    assert_difference('PartsIncluded.count', -1) do
      delete parts_included_url(@parts_included)
    end

    assert_redirected_to parts_includeds_url
  end
end
