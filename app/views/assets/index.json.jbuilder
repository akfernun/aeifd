json.array!(@assets) do |asset|
  json.extract! asset, :id, :name
  json.url asset_url(asset, format: :json)
end
