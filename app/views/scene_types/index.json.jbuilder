json.array!(@scene_types) do |scene_type|
  json.extract! scene_type, :id, :name
  json.url scene_type_url(scene_type, format: :json)
end
