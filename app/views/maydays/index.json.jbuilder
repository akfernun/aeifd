json.array!(@maydays) do |mayday|
  json.extract! mayday, :id, :incident_assignment_id
  json.url mayday_url(mayday, format: :json)
end
