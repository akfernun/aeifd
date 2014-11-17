json.array!(@mayday_assignments) do |mayday_assignment|
  json.extract! mayday_assignment, :id, :mayday_id, :asset_id
  json.url mayday_assignment_url(mayday_assignment, format: :json)
end
