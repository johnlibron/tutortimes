class RegistrationController < ApplicationController
  before_action :load_user

  def show
    @time_slots = TimeSlot.ordered.all
  end

  def register
    selected_time_slot = TimeSlot.find(params[:time_slot_id])
    conflict_registrations = Registration.joins(:user).joins(:time_slot)
      .where("users.token = '#{params[:token]}' AND
      time_slots.name != '#{selected_time_slot.name}' AND (
      '#{selected_time_slot.begins_at}' BETWEEN time_slots.begins_at AND time_slots.ends_at OR
      '#{selected_time_slot.ends_at}' BETWEEN time_slots.begins_at AND time_slots.ends_at OR
      time_slots.begins_at BETWEEN '#{selected_time_slot.begins_at}' AND '#{selected_time_slot.ends_at}')")

    if conflict_registrations.length > 0
      conflict_time_slots = []
      conflict_time_slot_ids = []
      conflict_registrations.each do |registration|
        conflict_time_slots.push(registration.time_slot.name)
        conflict_time_slot_ids.push(registration.time_slot.id)
      end
      redirect_to registration_path, notice: {
        warning: "\"#{selected_time_slot.name}\" has a schedule conflict with \"#{conflict_time_slots.join('", "')}\".",
        selected_time_slot_id: selected_time_slot.id,
        conflict_time_slot_ids: conflict_time_slot_ids
      }
    elsif selected_time_slot.registrations_count < selected_time_slot.capacity
      @user.registrations.create!(time_slot_id: params[:time_slot_id])
      redirect_to action: :show
    else
      render :new, status: :unprocessable_entity
    end
  end

  def register_conflict_time_slot
    conflict_time_slot_ids = params[:conflict_time_slot_ids].split(',')
    conflict_time_slot_ids.each do |id|
      @user.registrations.where(time_slot_id: id).destroy_all
    end
    @user.registrations.create!(time_slot_id: params[:selected_time_slot_id])
    redirect_to action: :show
  end

  def cancel
    @user.registrations.where(time_slot_id: params[:time_slot_id]).destroy_all
    redirect_to action: :show
  end

  private def load_user
    @user = User.find_by!(token: params[:token])
  end
end