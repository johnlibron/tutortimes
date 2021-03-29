require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:unregistered)
    @time_slot = time_slots(:chemistry)
  end

  test "should load a user's registration page by token" do
    get registration_url(@user.token)
    assert_response :success
  end

  test "should create a registration" do
    assert_difference("Registration.count") do
      put register_url(@user.token, @time_slot.id)
    end
    assert_redirected_to registration_url(@user.token)
  end

  test "should delete a registration" do
    assert_difference("Registration.count", -1) do
      delete cancel_url(users(:registered).token, registrations(:one).time_slot_id)
    end
    assert_redirected_to registration_url(users(:registered).token)
  end
end
