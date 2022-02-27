require "application_system_test_case"

class TimeSlotsTest < ApplicationSystemTestCase
  setup do
    @time_slot = time_slots(:art_history)
  end

  test "visiting the index" do
    visit time_slots_url
    assert_selector "h1", text: "Time Slots"
  end

  test "creating a Time slot" do
    visit time_slots_url
    click_on "New Time Slot"

    fill_in "Name", with: @time_slot.name
    select_date_and_time @time_slot.begins_at, from: "time_slot_begins_at"
    select_date_and_time @time_slot.ends_at, from: "time_slot_ends_at"
    fill_in "Capacity", with: @time_slot.capacity
    click_on "Create Time slot"

    assert_text "Time slot was successfully created"
    click_on "Back"
  end

  test "updating a Time slot" do
    visit time_slots_url
    click_on "Edit", match: :first

    fill_in "Name", with: @time_slot.name
    select_date_and_time @time_slot.begins_at, from: "time_slot_begins_at"
    select_date_and_time @time_slot.ends_at, from: "time_slot_ends_at"
    fill_in "Capacity", with: @time_slot.capacity
    click_on "Update Time slot"

    assert_text "Time slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Time slot" do
    visit time_slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time slot was successfully destroyed"
  end
end
