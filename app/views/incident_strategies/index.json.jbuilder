json.array!(@incident_strategies) do |incident_strategy|
  json.extract! incident_strategy, :id, :name
  json.url incident_strategy_url(incident_strategy, format: :json)
end
