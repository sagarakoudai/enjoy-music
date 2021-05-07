require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow_index" do
    get relationships_follow_index_url
    assert_response :success
  end

  test "should get follower_index" do
    get relationships_follower_index_url
    assert_response :success
  end

end
