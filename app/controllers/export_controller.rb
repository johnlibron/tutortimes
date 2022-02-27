require 'csv'

class ExportController < ApplicationController

    # GET /export/:date
    def index
        registrations = Registration.joins(:user)
        time_slots = TimeSlot.ordered.all

        time_slot_ids = []
        headers = []

        time_slots.each do |time_slot|
            begins_at_df = time_slot.begins_at.strftime("%Y-%m-%d")
            ends_at_df = time_slot.ends_at.strftime("%Y-%m-%d")

            begins_at_tf = time_slot.begins_at.strftime("%I:%M")
            ends_at_tf = time_slot.ends_at.strftime("%I:%M%p")

            if params[:date] == begins_at_df && params[:date] == ends_at_df
                headers.push("#{time_slot.name} (#{begins_at_tf}-#{ends_at_tf})")
                time_slot_ids.push(time_slot.id)
            end
        end

        rows = []
        user_registrations = {}

        registrations.each do |registration|
            user_time_slots = Array.new(time_slot_ids.length)
            student = registration.user.name + " (#{registration.user.email})"
            registered_time_slot_index = time_slot_ids.find_index(registration.time_slot_id)
            if user_registrations.has_key? student
                if registered_time_slot_index
                    user_registrations[student][registered_time_slot_index] = "X"
                end
            else
                if registered_time_slot_index
                    user_time_slots[registered_time_slot_index] = "X"
                end
                user_registrations[student] = user_time_slots
            end
        end

        if headers.length > 0
            headers = ["Student"] + headers

            file = "#{Rails.root}/public/#{params[:date]}.csv"

            CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
                user_registrations.each do |key, array|
                    if array.include?("X")
                        writer << [key] + array
                    end
                end
            end
        end

    end
end