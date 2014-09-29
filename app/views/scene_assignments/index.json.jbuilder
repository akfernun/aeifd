json.array!(@scene_assignments) do |scene_assignment|
  json.extract! scene_assignment, :id, :scene_id, :asset_id, :arrival_time, :location
  json.url scene_assignment_url(scene_assignment, format: :json)
end
