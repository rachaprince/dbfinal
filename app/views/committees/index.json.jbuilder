json.array!(@committees) do |committee|
  json.extract! committee, :id, :name, :region, :country
  json.url committee_url(committee, format: :json)
end
