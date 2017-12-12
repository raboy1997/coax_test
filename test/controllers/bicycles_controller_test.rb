require 'test_helper'

class BicyclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bicycles_index_url
    assert_response :success
  end

end
