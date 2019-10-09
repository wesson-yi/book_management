require 'test_helper'

class DealsControllerTest < ActionDispatch::IntegrationTest
  test 'should get borrow' do
    get deals_borrow_url
    assert_response :success
  end

  test 'should get return' do
    get deals_return_url
    assert_response :success
  end
end
