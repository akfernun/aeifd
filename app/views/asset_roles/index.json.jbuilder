json.array!(@asset_roles) do |asset_role|
  json.extract! asset_role, :id, :name
  json.url asset_role_url(asset_role, format: :json)
end
