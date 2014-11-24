json.array!(@checkoff_maydays) do |checkoff_mayday|
  json.extract! checkoff_mayday, :id, :mayday_id, :checkoff_id, :status
  json.url checkoff_mayday_url(checkoff_mayday, format: :json)
end
