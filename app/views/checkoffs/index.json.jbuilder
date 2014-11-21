json.array!(@checkoffs) do |checkoff|
  json.extract! checkoff, :id, :name, :type
  json.url checkoff_url(checkoff, format: :json)
end
