json.array!(@incident_assignments) do |incident_assignment|
  json.extract! incident_assignment, :id, :incident_id, :location_id, :asset_role_id, :asset_id
  json.url incident_assignment_url(incident_assignment, format: :json)
end
