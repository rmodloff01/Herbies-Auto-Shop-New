require 'test_helper'

class IncludedPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @included_part = included_parts(:one)
  end

  test "should get index" do
    get included_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_included_part_url
    assert_response :success
  end

  test "should create included_part" do
    assert_difference('IncludedPart.count') do
      post included_parts_url, params: { included_part: { inv_id: @included_part.inv_id, part_id: @included_part.part_id } }
    end

    assert_redirected_to included_part_url(IncludedPart.last)
  end

  test "should show included_part" do
    get included_part_url(@included_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_included_part_url(@included_part)
    assert_response :success
  end

  test "should update included_part" do
    patch included_part_url(@included_part), params: { included_part: { inv_id: @included_part.inv_id, part_id: @included_part.part_id } }
    assert_redirected_to included_part_url(@included_part)
  end

  test "should destroy included_part" do
    assert_difference('IncludedPart.count', -1) do
      delete included_part_url(@included_part)
    end

    assert_redirected_to included_parts_url
  end
end
