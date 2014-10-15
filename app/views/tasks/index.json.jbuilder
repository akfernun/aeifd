json.array!(@tasks) do |task|
  json.extract! task, :id, :primar_search, :all_clear, :utilities_contacted, :safety_officer_arrived, :utilities_disconnected, :secondary_search, :fire_under_control
  json.url task_url(task, format: :json)
end
