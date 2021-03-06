require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  setup do
    @user = users(:registered)
  end

  test "shows user's name and all time slots" do
    visit registration_url(@user.token)
    assert_selector "h1", text: @user.name
    assert_selector ".time_slot", count: TimeSlot.count
  end

  test "registers for a time slot" do
    visit registration_url(users(:unregistered).token)
    assert_selector ".time_slot.registered", count: 0
    click_on "Register", match: :first
    assert_selector ".time_slot.registered", count: 1
  end

  test "cancels a registration" do
    visit registration_url(@user.token)
    assert_selector ".time_slot.registered", count: 1
    click_on "Cancel", match: :first
    assert_selector ".time_slot.registered", count: 0
  end
end
