json.array!(@scenes) do |scene|
  json.extract! scene, :id, :incident_id, :name
  json.url scene_url(scene, format: :json)
end
