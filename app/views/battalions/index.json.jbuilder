json.array!(@battalions) do |battalion|
  json.extract! battalion, :id, :name
  json.url battalion_url(battalion, format: :json)
end
