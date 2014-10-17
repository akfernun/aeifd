json.array!(@timers) do |timer|
  json.extract! timer, :id, :primary_search, :all_clear, :utilities_contacted, :safety_officer_arrived, :utilities_disconnected, :secondary_search, :fire_under_control, :incident_id
  json.url timer_url(timer, format: :json)
end
