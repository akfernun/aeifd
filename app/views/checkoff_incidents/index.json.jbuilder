json.array!(@checkoff_incidents) do |checkoff_incident|
  json.extract! checkoff_incident, :id, :incident_id, :checkoff_id, :status
  json.url checkoff_incident_url(checkoff_incident, format: :json)
end
